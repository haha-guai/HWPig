@Entry
@Component
struct page6{
  build(){
    Row(){
      Column(){
        TextInput({placeholder:"请输入账号或手机号"})
          .width(300)
          .placeholderColor(Color.Gray)
          .placeholderFont({size:14})
          .caretColor(Color.Red)
          .onChange(value=> {
            console.log(value);
          })
      }
      .width("100%")
    }
    .height("100%")
  }
}