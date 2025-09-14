import myElement from './Page'

@Entry
@Component
struct test{
  build(){
    Row(){
      myElement()
    }
  }
}