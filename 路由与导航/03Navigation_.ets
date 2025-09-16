let numList:number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

@Entry
@Component
struct mainTest{
  @State pathStack:NavPathStack = new NavPathStack();
  @Builder
  turnNewPage(name:string | number){
    subPage(name);
  }
  build(){
    Navigation(this.pathStack){
      Flex({wrap:FlexWrap.Wrap}){
        ForEach(numList, (item:number)=>{
          Column(){
            subApp(item);
          }
          .width(80)
          .height(80)
          .margin(20)
          .onClick(()=>{
            this.pathStack.pushPathByName(`${item}`, null)
          })
        })

      }
      .width('100%')
      .height('100%')

    }
    .title('测试')
    .titleMode(NavigationTitleMode.Mini)
    .menus([
      {value:'搜索', icon:null}
    ])
    .toolbarConfiguration([
      {value:'主页', icon:null},
      {value:'设置', icon:null},
      {value:'分类', icon:null},
      {value:'收藏', icon:null},
      {value:'我的', icon:null},
    ])
    .navDestination(this.turnNewPage)
  }
}

@Builder
function subApp(name:string | number){
    Text(`${name}`)
      .backgroundColor(Color.Pink)
      .fontColor(Color.Gray)
      .fontSize(30)
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
      .borderRadius(20)
}

@Builder
function subPage(name:string | number) {
  NavDestination() {
    Text(`${name}`)
      .fontSize(80)
      .fontColor(Color.Black)
  }
  .width('100%')
  .height('100%')
}