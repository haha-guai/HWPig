interface ReplyItem{
  id:number;
  photo:ResourceStr;
  name:string;
  content:string;
  time:string;
  ip:string;
  likeNum:number;
  likeFlag:boolean;
}

class ReplyItemModel implements ReplyItem{
  id: number = 0;
  photo: string | Resource = '';
  name: string = '';
  content: string = '';
  time: string = '';
  ip: string = '';
  likeNum: number = 0;
  likeFlag: boolean = false;

  constructor(model: ReplyItem){
    this.id = model.id;
    this.photo = model.photo;
    this.name = model.name;
    this.content = model.name;
    this.time = model.time;
    this.ip = model.ip;
    this.likeNum = model.likeNum;
    this.likeFlag = model.likeFlag;
  }
}


let dataList:ReplyItemModel[] = [
  new ReplyItemModel({
    id: 1,
    photo: $r('app.media.image01'),
    name: '飞天猪',
    content: '十年生死两茫茫，不思量，自难忘。',
    time: '05-20 14:32',
    ip: '江西',
    likeNum: 32,
    likeFlag: false
  }),
  new ReplyItemModel({
    id: 2,
    photo: $r('app.media.image02'),
    name: '清风挽发',
    content: '接天莲叶无穷碧，映日荷花别样红。',
    time: '05-20 15:01',
    ip: '浙江',
    likeNum: 18,
    likeFlag: true
  }),
  new ReplyItemModel({
    id: 3,
    photo: $r('app.media.image03'),
    name: '橘子汽水',
    content: '落霞与孤鹜齐飞，秋水共长天一色。',
    time: '05-20 16:45',
    ip: '湖南',
    likeNum: 47,
    likeFlag: false
  }),
  new ReplyItemModel({
    id: 4,
    photo: $r('app.media.image04'),
    name: '星河入梦',
    content: '醉后不知天在水，满船清梦压星河。',
    time: '05-20 18:12',
    ip: '四川',
    likeNum: 64,
    likeFlag: true
  }),
  new ReplyItemModel({
    id: 5,
    photo: $r('app.media.image05'),
    name: '夜雨声烦',
    content: '君问归期未有期，巴山夜雨涨秋池。',
    time: '05-20 19:55',
    ip: '重庆',
    likeNum: 23,
    likeFlag: false
  }),
  new ReplyItemModel({
    id: 6,
    photo: $r('app.media.image06'),
    name: '白茶清欢',
    content: '白茶清欢无别事，我在等风也等你。',
    time: '05-20 21:20',
    ip: '福建',
    likeNum: 41,
    likeFlag: true
  }),
  new ReplyItemModel({
    id: 7,
    photo: $r('app.media.image07'),
    name: '一纸荒年',
    content: '山河远阔，人间烟火，无一是你，无一不是你。',
    time: '05-20 22:44',
    ip: '云南',
    likeNum: 55,
    likeFlag: false
  }),
  new ReplyItemModel({
    id: 8,
    photo: $r('app.media.image08'),
    name: '南风知我意',
    content: '南风知我意，吹梦到西洲。',
    time: '05-21 08:10',
    ip: '广东',
    likeNum: 29,
    likeFlag: true
  }),
  new ReplyItemModel({
    id: 9,
    photo: $r('app.media.image09'),
    name: '月下听花',
    content: '今人不见古时月，今月曾经照古人。',
    time: '05-21 09:36',
    ip: '江苏',
    likeNum: 38,
    likeFlag: false
  }),
  new ReplyItemModel({
    id: 10,
    photo: $r('app.media.image10'),
    name: '云边有个小卖部',
    content: '生命是有光的，在我熄灭以前，能够照亮你一点，就是我所有能做的了。',
    time: '05-21 11:05',
    ip: '上海',
    likeNum: 77,
    likeFlag: true
  })
];


@Component
struct Bar{
  title: string = '标题';
  build(){
    Row(){
      Row(){
        Image($r('sys.media.ohos_ic_compnent_titlebar_back_filled'))
          .fillColor('#999')
          .padding(4)
      }
      .width(30)
      .height(30)
      .borderRadius(15)
      .backgroundColor(0xf4f4f4)
      .justifyContent(FlexAlign.Center)
      .margin({left:20})

      Text(this.title)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({right:50})
    }
    .width('100%')
    .height(50)
    .border({color:0xf4f5f6, width:{bottom:1}})
  }
}

@Component
struct CommentItem{
  item: ReplyItemModel = new ReplyItemModel({} as ReplyItem);
  build(){
    Row({space:10}){
      Image(this.item.photo)
        .width(40)
        .height(40)
        .borderRadius('50%')
      Column({space:10}){
        Text(this.item.name)
          .fontColor(0x303a43)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .fontColor(0x2f3642)
          .lineHeight(22)
        Row(){
          Text(`${this.item.time} IP属地：${this.item.ip}`)
            .fontColor(0xaaa)
            .fontSize(12)
          Row({space:4}){
            Image($r('app.media.image03'))
              .width(12)
              .height(12)
              .fillColor(this.item.likeFlag ? Color.Red : 0xcacaca)
            Text(this.item.likeNum.toString())
              .fontColor(this.item.likeFlag ? Color.Red : 0xcacaca)
              .fontSize(12)
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .alignItems(VerticalAlign.Top)
    .padding(20)
    .width('100%')
  }
}

@Component
struct ReplyInput{
  @State content: string = '';
  publish: (content: string) => void = () => {};
  build(){
    Row({space:10}){
      TextInput({text: $$this.content, placeholder: '请输入评论'})
        .layoutWeight(1)
        .height(40)
        .onSubmit(() => {
          if (this.content){
            this.publish(this.content);
            this.content = '';
          }
        })
      Button('发布')
        .onClick(() => {
          if (this.content){
            this.publish(this.content);
            this.content = '';
          }
        })
    }
    .padding({left:10, right:10})
    .width('100%')
    .height(60)
  }
}


@Entry
@Component
struct Page{
  @State currentComment: ReplyItemModel = new ReplyItemModel({
    id: 999,
    name: '小明',
    photo: $r('app.media.image02'),
    likeNum: 10,
    likeFlag: false,
    time: '03-02',
    ip: '北京',
    content: '自从我升级了鸿蒙系统，真的感觉手机的流畅度提升了不少。每次滑动屏幕和点击应用，都能感受到那种丝滑般的顺畅，真是太棒了！'
  })
  @State commentList:ReplyItemModel[] = dataList;
  scroller: Scroller = new Scroller();
  addComment(content:string){
    this.commentList.unshift(new ReplyItemModel({
      id: Math.random(),
      photo: $r('app.media.image09'),
      name: '猪儿哥',
      content,
      time: `${(new Date().getMonth() + 1).toString().padStart(2, '0')}-${new Date().getDate().toString().padStart(2,  '0')}`,
      ip: '江西',
      likeNum: 0,
      likeFlag: false
    }))
    this.scroller.scrollEdge(Edge.Top);
  }
  build(){
    Column(){
      Bar({title:'评论回复'})
      CommentItem({item: this.currentComment})
      Divider()
        .strokeWidth(6)
      Row(){
        Text('评论数50')
      }
      .width('100%')
      .height(50)
      .padding({left:20})
      .border({color:0xf3f4f5, width:{bottom:1}})
      List({scroller:this.scroller}) {
        ForEach(this.commentList, (item: ReplyItemModel) => {
          ListItem() {
            CommentItem({ item })
          }
        })
      }
      .layoutWeight(1)
      .width('100%')
      .height('100%')
      ReplyInput({
        publish: (content: string) => {
          this.addComment(content);
        }
      })
    }
  }
}