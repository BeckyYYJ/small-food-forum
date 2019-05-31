package function;

public class Place {
    int state;
    private  String first,second,third;

    Place(int state){
        this.state=state;
    }
    public void ParseChar(){
        int a=state/100;
        int b=state/10%10;        int c=state%10;

        switch(a){
            case(1):this.first="菜谱";break;
            case(2):this.first="美食推荐";break;
            case(3):this.first="交友";break;
            case(4):this.first="测评";break;
        }
        if(a==1){
        switch(b){
            case(1):this.second="中式料理";break;
            case(2):this.second="西方烹饪";break;
            case(3):this.second="其他";break;
            case(4):this.second="测评";break;
        }
        if(b!=3)
        switch(c){
            case(1):this.third="图文";break;
            case(2):this.third="视频";break;
            case(3):this.third="创新";break;
        }
        else
            switch(c){
                case(1):this.third="日料 ";break;
                case(2):this.third="韩料";break;
                case(3):this.third="拉丁风情";break;
                case(4):this.third="小众口味";break;
            }
    }else if(a==2){
            switch(b){
                case(1):this.first="店铺推荐";break;
                case(2):this.first="美食推荐";break;
            }
            if(b==1)
                switch(c){
                    case(1):this.third="家常菜";break;
                    case(2):this.third="烧烤火锅麻辣烫";break;
                    case(3):this.third="日韩料";break;
                    case(4):this.third="面包点心冰淇淋";break;
                    case(5):this.third="其他";break;
                }
            else if(b==2)
                switch(c){
                    case(1):this.third="国产美食";break;
                    case(2):this.third="亚洲";break;
                    case(3):this.third="欧美洲";break;
                    case(4):this.third="其他";break;
                }
        }else if (a==3){
            switch(b){
                case(1):this.second="初来乍到";this.third="新厨身份认证";break;
                case(2):this.second="互帮互助";break;
                case(3):this.second="阶级扶弱";break;
            }
            if(b==2)
                switch(c){
                    case(1):this.third="找厨友";break;
                    case(2):this.third="爆照区";break;
                }
            if(b==3)
            switch(c){
                    case(1):this.third="找师傅";break;
                    case(2):this.third="收徒弟";break;
                    case(3):this.third="求助区";break;
                }
        }else if(a==4) {
            switch(b){
                case(1):this.first="厨具测评";break;
                case(2):this.first="食材测评";break;
            }
            if(b==1)
                switch(c){
                    case(1):this.third="锅";break;
                    case(2):this.third="微波炉烤箱面包机等";break;
                    case(3):this.third="刀";break;
                    case(4):this.third="其他";break;
                }
            else
                switch(c){
                    case(1):this.third="粮油";break;
                    case(2):this.third="蔬菜水果";break;
                    case(3):this.third="水产";break;
                    case(4):this.third="其他";break;
        }
        }
    }
}
