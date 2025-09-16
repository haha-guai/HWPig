//pushPathByName(name) 调用后将name传给Navigation
//Navigation通过navDestination属性将name调给Builder函数然后构建子页面

class user{
  username:string = '';
  password:string = '';
}
let userList:user[] = [];
@Builder
function turnPage(name:string){
  if (name == 'page2') page2();
  else if (name == 'page3') page3(); //拦截器，在跳转前验证
  else if (name == 'page1') page1();
}


@Entry
@Component
struct page1{
  pathStack:NavPathStack = new NavPathStack();
  build(){
    Navigation(this.pathStack){
      Column({space:10}){
        Row({space:10}){
          Text('账号')
          TextInput().tiStyle()
        }.rStyle()
        Row({space:10}){
          Text('密码')
          TextInput().tiStyle()
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
  }
}


@Component
struct page2{
  pathStack:NavPathStack = new NavPathStack();
  build(){
    NavDestination(){
      Column({space:10}){
        Row({space:5}){
          Text('账号').tStyle()
          TextInput().tiStyle()
        }.rStyle()
        Row({space:5}){
          Text('密码').tStyle()
          TextInput().tiStyle()
        }.rStyle()
        Row({space:5}){
          Text('确认密码').tStyle()
          TextInput().tiStyle()
        }.rStyle().margin({bottom:30})

        Button('注册').bStyle()
          .onClick(()=>{
            //check and add
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

