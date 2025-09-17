//被Require装饰的变量，在使用时必须赋值，所以一般用于约束子件属性必须有父件传入
//用Trace修饰类后，该类中只有被修饰的属性能被组件使用,使用未被修饰的会报错

class info{
  @Track num1:number = 1;
  num2:number = 2;
  constructor(num1:number, num2:number) {
    this.num1 = num1;
    this.num2 = num2;
  }
}


@Component
struct sub{
  @Require num:number = 32;
  build(){
    Text(this.num.toString())
  }
}

@Entry
@Component
struct main{
  num:number = 23;
  build(){
    Column(){
      sub({num:this.num})
      Text(new info(23, 43).num1.toString())
      //Text(new info(23, 43).num2.toString())
      //据说第二行会报错，实际没有，可能原因，要开启严格模式
    }

  }
}