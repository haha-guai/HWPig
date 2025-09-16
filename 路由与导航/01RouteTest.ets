import {promptAction, router} from '@kit.ArkUI';

@Entry
@Component
struct mainPage{
  build(){
    Column({space:20}){
      Text('页面0')
      Button('跳转至其他模块')
        .onClick(() => {
          router.pushUrl({url:'@bundle:com.example.myapplication/library/ets/pages/Index'},
            err => {
              if (err) {
                console.log(err.code + "");
                console.log(err.message);
              }
            }
          );
        })
      Button('跳转页面1')
        .onClick(() => {
          promptAction.showDialog({
            message:'是否要前往下一页',
            buttons:[
              {text:'否', color:'#f00'},
              {text:'是', color:'#09f'}
            ]
          }).then(result => {
            if (result.index == 0)
              console.log('取消前往')
            else{
              console.log('前往')
              router.pushUrl({url:'pages/Page', params:{message:'我是飞天无敌猪儿哥'}},
                err => {
                  if (err){
                    console.log(err.code + "");
                    console.log(err.message);
                  }
                });
              console.log('溜了溜了')
            }
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}

