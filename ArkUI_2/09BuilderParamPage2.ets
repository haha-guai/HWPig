//尾随闭包
//自定义组件尾随闭包需要有且仅有一个无参的@BuilderParam属性
//BuilderParam属性需要有默认非空实现的Builder函数才能当尾随闭包
//普通插槽不需要非空默认发实现

@Component
struct child{
  panelHeight = 300;
  panelColor = Color.Gray
  @Builder
  buildSelf(){}
  @BuilderParam body:()=>void = this.buildSelf;
  build(){
    Column(){
      Column(){
        this.body()
      }
        .backgroundColor(this.panelColor)
        .width('100%')
        .height(this.panelHeight)
        .borderRadius(20)
    }
    .padding(20)
  }
}

@Entry
@Component
struct parent{
  build(){
    Column({space:20}){
      child({panelHeight:200, panelColor:Color.Pink}){
        Flex({direction:FlexDirection.Row, wrap:FlexWrap.Wrap, justifyContent:FlexAlign.Center}){
          ForEach([1, 2, 3, 4, 5, 6, 8], (item:number)=>{
            Button('app'+item)
              .margin(10)
          })
        }
      }
      child({panelHeight:100, panelColor:Color.Orange})
    }
  }
}