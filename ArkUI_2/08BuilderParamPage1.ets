//@BuiderParam装饰器

@Component
struct subComponent{
  @Builder
  buildSelf(text:string){
    Text(text)
  }
  @BuilderParam content: (text:string)=>void = this.buildSelf;
  build(){
    Column(){
      this.content('飞天猪儿哥')
    }
  }
}


@Entry
@Component
struct test{
  @Builder
  buildSelf(text:string){
    Text(text)
  }
  build(){
    Column(){
      subComponent({
        content:()=>{
          this.buildSelf('遁地猪儿哥')
        }
      })
    }
  }
}