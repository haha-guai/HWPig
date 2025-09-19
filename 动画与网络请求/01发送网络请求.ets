import { http } from '@kit.NetworkKit';

interface info{
  userId:number;
  id:number;
  title:string;
  body:string;
}

@Entry
@Component
struct main{
  build(){

  }
}


let content1:string;
let content2:info[];

async function getWebString(url:string){
  const httpRequest = http.createHttp()
  const res = await httpRequest.request(url, {
    method:http.RequestMethod.GET,
    expectDataType:http.HttpDataType.STRING
  })
  content1 = res.result as string
  httpRequest.destroy()
  console.log(content1.toString())
}

async function getWebObject(url:string){
  const httpRequest = http.createHttp()
  const res = await httpRequest.request(url, {
    method:http.RequestMethod.GET,
    expectDataType:http.HttpDataType.OBJECT
  })
  content2 = res.result as info[]
  httpRequest.destroy()
  for (let i = 0; i < content2.length; i++)
    console.log(content2[i].body)

}

getWebObject('https://jsonplaceholder.typicode.com/posts')



/*

 "requestPermissions": [
      {"name": "ohos.permission.INTERNET"},
      {"name": "ohos.permission.GET_NETWORK_INFO"}
    ]

*/