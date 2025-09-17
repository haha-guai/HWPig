@Component
struct sub1{
  @Prop num: number = 0;
  build(){
    Row({space:20}){
      Text(`子组件: ${this.num}`)
      Button('+1')
        .onClick(()=>{
          this.num += 1;
        })
    }
  }
}

@Component
struct sub2{
  @Link num: number;
  build(){
    Row({space:20}){
      Text(`子组件: ${this.num}`)
      Button('+1')
        .onClick(()=>{
          this.num += 1;
        })
    }
  }
}


@Entry
@Component
struct main{
  @State num1: number = 0;
  @State num2: number = 0;
  build(){
    Column({space:20}){
      Row({space:20}){
        sub1({num:this.num1})
        Text(`父组件: ${this.num1}`)
        Button('+1')
          .onClick(()=>{
            this.num1 += 1;
          })
      }
      Row({space:20}){
        sub2({num:this.num2})
        Text(`父组件: ${this.num2}`)
        Button('+1')
          .onClick(()=>{
            this.num2 += 1;
          })
      }
    }
  }
}