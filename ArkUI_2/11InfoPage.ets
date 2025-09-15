interface info{
  position: string;
  time: string;
  company: string;
  salary: string;
}

let myInfo:info = {position:'吃白饭工程师', time:'2012-6--2014-11', company:'猪儿公司', salary:'323344元'}
let infoList:info[] = [myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo, myInfo]

@Entry
@Component
struct test{
  @Builder
  oneInfo(type:string, theInfo:string){
    Row(){
      Text(type)
      Text(theInfo)
    }
    .height(25)
    .width('90%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
  build(){
    List(){
      ForEach(infoList, (item:info) => {
        ListItem(){
          Column(){
            this.oneInfo('职位', item.position);
            this.oneInfo('工作年度', item.time);
            this.oneInfo('公司名称', item.company);
            this.oneInfo('薪资', item.salary);
          }
          .width('100%')
        }
      })
    }
    .divider({strokeWidth:2, color:Color.Gray})
  }
}