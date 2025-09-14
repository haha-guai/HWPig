@Entry
@Component
struct page5{
  build(){
    Column(){
      Image($r("app.media.image2"))
        .width("100%")
        .borderRadius(20)
      Text("这是一个香蕉")
        .fontSize(20)
        .fontColor(Color.Red)
        .decoration({type:TextDecorationType.LineThrough, color:Color.Black})
      Text("这是一个铅笔")
        .fontSize(25)
        .decoration({type:TextDecorationType.Underline, color:Color.Black})
    }
    .width("100%")
    .height("100%")
  }
}