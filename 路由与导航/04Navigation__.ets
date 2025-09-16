@Entry
@Component
struct mainPage{
  @State isAgree:boolean = false;
  pathStack: NavPathStack = new NavPathStack();
  intercept(){
    this.pathStack.setInterception({
      willShow: (from, to)=>{
          if (from == 'navBar' && typeof to != 'string')
            if (this.isAgree) return;
            else{
              to.pathStack.pop();
              to.pathStack.pushPathByName('sub2', null);
            }
      }
    })
  }
  build(){
    Navigation(this.pathStack){
      Column(){
        Button('跳转子页', {type:ButtonType.Normal})
          .width(200)
          .height(100)
          .borderRadius(30)
          .backgroundColor(this.isAgree ? Color.Green : Color.Gray)
          .onClick(()=>{
            this.pathStack.pushPathByName('sub1', null);
          })
        Row(){
          Text('同意协议')
          Checkbox()
            .select($$this.isAgree)
        }
      }

    }
    .onAppear(()=>{
      this.intercept();
    })
  }
}





/*
//子页1

@Entry
@Component
struct subPage{
  pathStack: NavPathStack = new NavPathStack();
  build(){
    NavDestination(){
      Button('返回上一页')
        .width(200)
        .height(100)
        .borderRadius(30)
        .onClick(()=>{
          this.pathStack.pop();
        })
    }
    .onReady(context => {
      this.pathStack = context.pathStack;
    })

  }
}
@Builder
function buildNav(){
  subPage()
}

//子页2

@Entry
@Component
struct subPage1 {
  @State message: string = '为什么不同意协议';
  build() {
    NavDestination() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = 'why？？';
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Builder
function buildNav_(){
  subPage1()
}




//router_map.json
{
  "routerMap": [
    {
      "name": "sub1",
      "pageSourceFile": "src/main/ets/pages/Page.ets",
      "buildFunction": "buildNav"
    },
    {
      "name": "sub2",
      "pageSourceFile": "src/main/ets/pages/Page1.ets",
      "buildFunction": "buildNav_"
    }
  ]
}


*/