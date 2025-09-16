@Entry
@Component
struct mainPage{
  @State findContent:string = '';
  pathStack: NavPathStack = new NavPathStack();
  findList = ['网络', '桌面', '应用', '网络设置', '桌面设置', '应用设置'];

  turnPage(name:string){
    this.pathStack.pushPathByName(name, null);
  }

  @Builder
  createPage(name: string){
    buildSub(this.pathStack, `${name}设置`);
  }

  build(){
    Navigation(this.pathStack){
      Column({space:15}){
        Row(){
          Text("设置中心")
            .margin({top:10, left:20})
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')

        TextInput({text:$$this.findContent, placeholder: '搜索'})
          .width(310)
          .height(50)
          .backgroundColor(Color.White)
          .padding({top:0, right:0, bottom:0})
          .onSubmit(()=>{
            for (let i = 0; i < 6; i++){
              if (this.findContent == this.findList[i]){
                this.turnPage(this.findContent.substring(0, 2));
                this.findContent = '';
              }
            }
          })

        Button('网络设置', {type:ButtonType.Normal}).bStyle()
          .onClick(()=>{
            this.turnPage('网络');
          })
        Button('桌面设置', {type:ButtonType.Normal}).bStyle()
          .onClick(()=>{
            this.turnPage('桌面');
          })
        Button('应用设置', {type:ButtonType.Normal}).bStyle()
          .onClick(()=>{
            this.turnPage('应用');
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(0xf1f1f1)
    }
    .titleMode(NavigationTitleMode.Mini)
    .menus([
      {value:'主页', icon:null},
      {value:'设置', icon:null},
      {value:'more', icon:null}
    ])
    .toolbarConfiguration([
      {value:'首页', icon:null},
      {value:'分类', icon:null},
      {value:'收藏', icon:null}
    ])
    .navDestination(this.createPage)


  }
}

@Extend(Button)
function bStyle(){
  .width(300)
  .height(80)
  .borderRadius(20)
  .backgroundColor(Color.White)
  .fontColor(Color.Gray)
  .fontSize(25)
}

@Extend(Navigation)
function nStyle(){
  .titleMode(NavigationTitleMode.Mini)
  .menus([
    {value:'主页', icon:null},
    {value:'设置', icon:null},
    {value:'more', icon:null}
  ])
  .toolbarConfiguration([
    {value:'首页', icon:null},
    {value:'分类', icon:null},
    {value:'收藏', icon:null}
  ])
}

@Builder
function buildSub(pathStack:NavPathStack, page:string){
  NavDestination(){
    Column(){
      Row(){
        Text(page)
          .fontSize(80)
          .onClick(()=>{
            pathStack.pop();
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}