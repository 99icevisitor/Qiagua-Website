using namespace std;
#include<iostream>
#include<cstring>
#include<iomanip>
#include<cmath>
struct Point{
	double x;
	double y;
}; 
int main(){
	int P;
	double x,y,r,x1,x2,y1,y2;//Բ�ģ��뾶��һ��Խ� 
	Point p1,p2,p3,p4;
	double desl1,desl2,desl3,desl4;
	double desp1,desp2,desp3,desp4;
	cin>>P;
	while(P--){
		cin>>x>>y>>r>>x1>>y1>>x2>>y2;
		p1.x = x1<x2?x1:x2;//���Ͻ� -,+
		p1.y = y1>y2?y1:y2;
		p2.x = x1>x2?x1:x2;//���Ͻ� +,+
		p2.y = y1>y2?y1:y2;
		p3.x = x1>x2?x1:x2;//���½� +,-
		p3.y = y1<y2?y1:y2;
		p4.x = x1<x2?x1:x2;//���½� -,-
		p4.y = y1<y2?y1:y2;
		/*
		
		*/ 
		desl1 = abs(p1.x - x);//�� 
		desl2 = abs(p1.y - y);//�� 
		desl3 = abs(p2.x - x);//�� 
		desl4 = abs(p2.y - y);//��
		desp1 = sqrt((p1.x-x)*(p1.x-x)+(p1.y-y)*(p1.y-y));
		desp2 = sqrt((p2.x-x)*(p2.x-x)+(p2.y-y)*(p2.y-y));
		desp3 = sqrt((p3.x-x)*(p3.x-x)+(p3.y-y)*(p3.y-y));
		desp4 = sqrt((p4.x-x)*(p4.x-x)+(p4.y-y)*(p4.y-y));
		if((desl1<=r && desp1>=r||desp4>=r)||(desl2<=r && desp1>=r||desp2>=r)||(desl3<=r && desp2>=r||desp3>=r)||(desl4<=r && desp3>=r||desp4>=r))
			cout<<"YES"<<endl;
		else cout<<"NO"<<endl;		
	}
	return 0;
} 
