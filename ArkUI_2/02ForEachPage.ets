//循环渲染
@Entry
@Component
struct testPage{
  @State list: Goods[] = [
    {id:1, name:'牙齿修复', img:$r('app.media.image01'), price:30},
    {id:2, name:'彩票神器', img:$r('app.media.image02'), price:30},
    {id:3, name:'血糖贴', img:$r('app.media.image03'), price:30},
    {id:4, name:'赌博神器', img:$r('app.media.image04'), price:30},
    {id:5, name:'生发神器1', img:$r('app.media.image05'), price:30},
    {id:6, name:'生发神器2', img:$r('app.media.image06'), price:30},
    {id:7, name:'睫毛神器', img:$r('app.media.image07'), price:30},
    {id:8, name:'生发神器3', img:$r('app.media.image08'), price:30},
    {id:9, name:'美白神器', img:$r('app.media.image09'), price:30},
    {id:10, name:'麻将神器', img:$r('app.media.image10'), price:30},

  ];
  build(){
    List(){
      ForEach(this.list, (goods:Goods)=>{
        ListItem(){
          Row(){
            Image(goods.img)
              .height('90%')
              .width('60%')
              .borderRadius(10)
              .margin({top:20})

            Column(){
              Text("商品：\n      " + goods.name).fontWeight(FontWeight.Bold)
              Text("商品编号：" + goods.id)
              Text("价格：￥" + goods.price).fontColor(Color.Red)
              Button("购买")
                .margin({top:10})
                .fontSize(15)
                .backgroundColor(Color.Red)
            }
            .alignItems(HorizontalAlign.Start)
            .margin({left:10, top:100})
          }
          .alignItems(VerticalAlign.Top)
          .width('100%')
          .height(250)
        }
      })




    }
    .backgroundColor(0xf1f1f1)
    .divider({
      strokeWidth:1, color:'red'
    })
  }
}


interface Goods{
  id: number;
  name: string;
  img: Resource;
  price: number;
}