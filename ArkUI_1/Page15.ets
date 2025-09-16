@Entry
@Component
struct page15{
  @State isMarry: boolean = false;
  @State message: string = "请输入手机号";
  build(){
    Grid(){
      GridItem()

      GridItem(){
        Column(){
          Text("checkBox")
          Checkbox()
            .select($$this.isMarry)
          Button(`${this.isMarry}`)
            .onClick(()=>{
              this.isMarry = !this.isMarry;
            })
        }
        .width('100%')
        .height('100%')
        .border({color:'red', width:2})
        .justifyContent(FlexAlign.Center)
      }

      GridItem(){
        Column(){
          Text("textInput")
          TextInput({text:$$this.message})
          Text(this.message)
        }
        .width('100%')
        .height('100%')
        .border({color:'red', width:2})
        .justifyContent(FlexAlign.Center)
      }

      GridItem()
    }
    .width('100%')
    .height('100%')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(20)
  }
}