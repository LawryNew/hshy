package main

import (
"os/exec"
"log"
)

//var url = "127.0.0.1:15672"

func main(){
  api_url := [2] string {"https://api.kqiutv.com/?service=Home.GetClassLive","https://api.kqiutv.com/?service=Redlist.GetRedList"}
  //api_url := [3] string {"https://api.kqiutv.com/?service=Home.GetClassLive","https://api.kqiutv.com/?service=Redlist.GetRedList","127.0.0.1:15674"}
  for i :=0; i < len(api_url); i++ {
  url := api_url[i] 
  cmd2 :=exec.Command("curl","-I",url)
  _,err := cmd2.CombinedOutput()

  if err != nil {
  cmd1 := exec.Command("curl","154.94.6.78:29933","-H","command:notify","-d",url,"-d"," 接口请求异常,请检查！！！")
  err := cmd1.Run()
  log.Fatalf("\n%s\n%s\n",url,err) //非得格式化输出 好j呐
            }
  //fmt.Printf("\n%s\n",out)

    }

}



