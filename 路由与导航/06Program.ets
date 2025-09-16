//pushPathByName(name) 调用后将name传给Navigation
//Navigation通过navDestination属性将name调给Builder函数然后构建子页面
import {promptAction} from '@kit.ArkUI';

class user{
  username:string = '';
  password:string = '';
  constructor(username:string, password:string) {
    this.username = username;
    this.password = password;
  }
}
let userList:user[] = [new user('11', '22')];

function check(username:string, password1:string, password2?:string):boolean{
  if (!password2){
    for (let i = 0; i < userList.length; i++)
      if (username == userList[i].username && username != '')
        if (password1 == userList[i].password)
          return true;
    return false;
  }
  else{
    for (let i = 0; i < userList.length; i++)
      if (username == userList[i].username) return false;
    if (password1 == password2) return true;
    return false;
  }
}

@Builder
function turnPage(name:string){
  if (name == 'page2') page2();
  else if (name == 'page3') page3();
  else if (name == 'page1') page1();
}


@Entry
@Component
struct page1{
  pathStack:NavPathStack = new NavPathStack();
  @State username:string = ''
  @State password:string = ''
  intercept(){
    this.pathStack.setInterception({
      willShow:(from, to)=>{
        if (typeof to != 'string' && to.pathInfo.name == 'page3'){
          if (!check(this.username, this.password)){
            to.pathStack.pop();
            promptAction.showToast({message:'信息不完整或密码错误'})
          }
          else
          promptAction.showToast({message:'登录成功'})
        }
      }
    })
  }
  build(){
    Navigation(this.pathStack){
      Column({space:10}){
        Row({space:10}){
          Text('账号')
          TextInput({text:$$this.username}).tiStyle()
        }.rStyle()
        Row({space:10}){
          Text('密码')
          TextInput({text:$$this.password}).tiStyle().type(InputType.Password)
        }.rStyle().margin({bottom:30})

        Button('登录').bStyle()
          .onClick(()=>{
            this.pathStack.pushPathByName('page3', null);
            //check
          })
        Button('注册').bStyle()
          .onClick(()=>{
            this.pathStack.pushPathByName('page2', null);
          })
      }.maxSize()
    }
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(turnPage)
    .onAppear(()=>{
      this.intercept();
    })
  }
}


@Component
struct page2{
  pathStack:NavPathStack = new NavPathStack();
  @State username:string = ''
  @State password1:string = ''
  @State password2:string = ''
  build(){
    NavDestination(){
      Column({space:10}){
        Row({space:5}){
          Text('账号').tStyle()
          TextInput({text:$$this.username}).tiStyle()
        }.rStyle()
        Row({space:5}){
          Text('密码').tStyle()
          TextInput({text:$$this.password1}).tiStyle().type(InputType.Password)
        }.rStyle()
        Row({space:5}){
          Text('确认密码').tStyle()
          TextInput({text:$$this.password2}).tiStyle().type(InputType.Password)
        }.rStyle().margin({bottom:30})

        Button('注册').bStyle()
          .onClick(()=>{
            if (check(this.username, this.password1, this.password2)){
              userList.unshift(new user(this.username, this.password1))
              promptAction.showToast({message:'注册成功'})
            }
            else
              promptAction.showToast({message:'注册失败'})

          })
        Button('登录').bStyle()
          .onClick(()=>{
            this.pathStack.pop();
          })
      }.maxSize()
    }
    .onReady(context=>{
      this.pathStack = context.pathStack;
    })
  }
}



@Component
struct page3{
  pathStack:NavPathStack = new NavPathStack();
  build(){
    NavDestination(){
      Column(){
        Text("当前您已登录")
          .width('100%')
          .fontSize(40)
          .textAlign(TextAlign.Center)
        Blank()
        Button("退出登录").bStyle()
          .onClick(()=>{
            this.pathStack.pop();
          })
      }.maxSize()
    }
    .onReady(context=>{
      this.pathStack = context.pathStack;
    })
  }
}


@Styles
function maxSize(){
  .width('100%')
  .height('100%')
}

@Extend(Button)
function bStyle(pathStack?:NavPathStack){
  .width(100)
}

@Extend(Text)
function tStyle(){
  .width(70)
  .padding({right:0})
  .textAlign(TextAlign.Start)
}

@Extend(TextInput)
function tiStyle(){
  .width(250)
}

@Extend(Row)
function rStyle(){
  .width('90%')

}