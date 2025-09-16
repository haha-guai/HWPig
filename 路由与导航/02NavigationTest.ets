@Builder
function child(name:string, color:Color){
  Text(name)
    .width('100%')
    .height('100%')
    .backgroundColor(color)
    .fontSize(30)
    .textAlign(TextAlign.Center)
    .fontColor(Color.White)
    .borderRadius(20)
    .border({width:2, color:Color.Red})
}



@Entry
@Component
struct test{
  @Builder
  getPageContent(name:string){
    if (name === 'pig1') pig1()
    else if (name === 'pig2') pig2()
    else pig3()
  }
  pathStack: NavPathStack = new NavPathStack();
  build(){
    Navigation(this.pathStack){
      Grid(){
        GridItem(){
          child('魔王猪', Color.Blue)
        }
        .onClick(()=>{
          this.pathStack.pushPathByName('pig1', null)
        })
        GridItem(){
          child('超级猪', Color.Green)
        }
        .onClick(()=>{
          this.pathStack.pushPathByName('pig2', null)
        })
        GridItem(){
          child('无敌猪', Color.Pink)
        }
        .onClick(()=>{
          this.pathStack.pushPathByName('pig3', null)
        })
        GridItem(){
          child('厉害猪', Color.Yellow)
        }
        .onClick(()=>{
          this.pathStack.pushPathByName('pig4', null)
        })
      }
      .width('100%')
      .height('100%')
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
    }
      .title('飞天猪')
      .titleMode(NavigationTitleMode.Mini)
      .menus([
        {value:'搜索',icon:null, action:() => {console.log('323')}}
      ])
      .toolbarConfiguration([
        {value:'设置', icon:null, action:()=>{console.log('222')}},
        {value:'收藏', icon:null, action:()=>{console.log('222')}},
        {value:'帮助', icon:null, action:()=>{console.log('222')}},
      ])
      .navDestination(this.getPageContent)
      .width('100%')
      .height('100%')
  }
}

@Component
struct pig1{
  build(){
    NavDestination(){
      Text('这里是魔王猪的世界')
    }
    .title('魔王猪的世界')
  }
}

@Component
struct pig2{
  build(){
    NavDestination(){
      Text('这里是魔王猪的世界')
    }
    .title('魔王猪的世界')
  }
}

@Component
struct pig3{
  build(){
    NavDestination(){
      Text('这里是魔王猪的世界')
    }
    .title('魔王猪的世界')
  }
}

@Component
struct pig4{
  build(){
    NavDestination(){
      Text('这里是魔王猪的世界')
    }
    .title('魔王猪的世界')
  }
}
