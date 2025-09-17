//Provide-Consume为一对多
//可以用变量名绑定（相同变量名），也可以用别名绑定，装饰器属性

@Component
struct subsub{
  @Consume num:number;
  build(){
    Row(){
      Text(`子子组件: ${this.num}`)
      Button('+1')
        .onClick(()=>{
          this.num++;
        })
    }

  }
}

@Component
struct sub{
  build(){
    Column(){
      Text('子组件   ')
      subsub()
    }
  }
}

@Entry
@Component
struct main{
  @Provide num:number = 0;
  build(){
    Column(){
      sub()
      Row(){
        Text(`父组件：${this.num}`)
        Button('+1')
          .onClick(()=>{
            this.num++;
          })
      }
    }
  }
}