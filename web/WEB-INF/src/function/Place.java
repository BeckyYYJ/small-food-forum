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
            case(1):this.first="����";break;
            case(2):this.first="��ʳ�Ƽ�";break;
            case(3):this.first="����";break;
            case(4):this.first="����";break;
        }
        if(a==1){
        switch(b){
            case(1):this.second="��ʽ����";break;
            case(2):this.second="�������";break;
            case(3):this.second="����";break;
            case(4):this.second="����";break;
        }
        if(b!=3)
        switch(c){
            case(1):this.third="ͼ��";break;
            case(2):this.third="��Ƶ";break;
            case(3):this.third="����";break;
        }
        else
            switch(c){
                case(1):this.third="���� ";break;
                case(2):this.third="����";break;
                case(3):this.third="��������";break;
                case(4):this.third="С�ڿ�ζ";break;
            }
    }else if(a==2){
            switch(b){
                case(1):this.first="�����Ƽ�";break;
                case(2):this.first="��ʳ�Ƽ�";break;
            }
            if(b==1)
                switch(c){
                    case(1):this.third="�ҳ���";break;
                    case(2):this.third="�տ����������";break;
                    case(3):this.third="�պ���";break;
                    case(4):this.third="������ı����";break;
                    case(5):this.third="����";break;
                }
            else if(b==2)
                switch(c){
                    case(1):this.third="������ʳ";break;
                    case(2):this.third="����";break;
                    case(3):this.third="ŷ����";break;
                    case(4):this.third="����";break;
                }
        }else if (a==3){
            switch(b){
                case(1):this.second="����է��";this.third="�³������֤";break;
                case(2):this.second="���ﻥ��";break;
                case(3):this.second="�׼�����";break;
            }
            if(b==2)
                switch(c){
                    case(1):this.third="�ҳ���";break;
                    case(2):this.third="������";break;
                }
            if(b==3)
            switch(c){
                    case(1):this.third="��ʦ��";break;
                    case(2):this.third="��ͽ��";break;
                    case(3):this.third="������";break;
                }
        }else if(a==4) {
            switch(b){
                case(1):this.first="���߲���";break;
                case(2):this.first="ʳ�Ĳ���";break;
            }
            if(b==1)
                switch(c){
                    case(1):this.third="��";break;
                    case(2):this.third="΢��¯�����������";break;
                    case(3):this.third="��";break;
                    case(4):this.third="����";break;
                }
            else
                switch(c){
                    case(1):this.third="����";break;
                    case(2):this.third="�߲�ˮ��";break;
                    case(3):this.third="ˮ��";break;
                    case(4):this.third="����";break;
        }
        }
    }
}
