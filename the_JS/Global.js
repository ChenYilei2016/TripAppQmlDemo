.pragma library

var theWidth = 0
var theHeight = 0
var multiplierH = 0
var multiplierW = 0
var theStackview //主stack

var theSetting

//计算高的函数
function dpH(numbers) {
       return numbers*multiplierH;
   }

//计算宽的函数
function dpW(numbers) {

   return numbers*multiplierW;
}

//平均值函数
function dpX(numbers){
   return (dpW(numbers)+dpH(numbers))/2;
}

var place_list =['选择地区','安徽','北京','福建','甘肃','广东','广西壮族自治区','贵州','海南','河北','黑龙江','湖南','江西','江苏','内蒙古自治区','青海','陕西','山西','上海','四川','西藏自治区','新疆维吾尔自治区','云南省','浙江']
var detail_list=['选择技艺',
    ['歙砚制作技艺','徽墨制作技艺','界首彩陶烧制技艺','万安罗盘制作技艺','芜湖铁画锻制技艺','宣纸制作技艺'],
    ['雕漆技艺','景泰蓝制作技艺','聚元号弓箭制作技艺','木版水印技艺'],
    ['德化瓷烧制技艺','福州脱胎漆器髹饰技艺','客家土楼营造技艺','武夷岩茶（大红袍）制作技艺','厦门漆线雕技艺'],
    ['保安族腰刀锻制技艺','兰州黄河大水车制作技艺'],
    ['端砚制作技艺','凉茶配制','石湾陶塑技艺'],
    ['侗族木构建筑营造技艺','壮族织锦技艺'],
    ['茅台酒酿制技艺','苗寨吊脚楼营造技艺','苗族蜡染技艺','苗族芦笙制作技艺','皮纸制作技艺','玉屏箫笛制作技艺'],
    ['黎族传统纺染织绣技艺','黎族树皮布制作技艺','黎族原始制陶技艺'],
    ['磁州窑烧制技艺'],
    ['赫哲族鱼皮制作技艺'],
    ['苗族银饰锻制技艺','土家族织锦技艺','浏阳花炮制作技艺'],
    ['金星砚制作技艺','景德镇传统瓷窑作坊营造技艺','景德镇手工制瓷技艺','铅山连四纸制作技艺'],
    ['雕版印刷技艺','风筝制作技艺（潍坊风筝、南通板鹞风筝、拉萨风筝）','金陵刻经印刷技艺','剧装戏具制作技艺','南京金箔锻制技艺','南京云锦木机妆花手工织造技艺','南通蓝印花布印染技艺','明式家具制作技艺','宋锦织造技艺','苏州缂丝织造技艺','苏州省御窑金砖制作技艺','香山帮传统建筑营造技艺','扬州漆器髹饰技艺','宜兴紫砂陶制作技艺','镇江恒顺香醋酿制技艺','制扇技艺'],
    ['桦树皮制作技艺','蒙古族勒勒车制作技艺'],
    ['加牙藏族织毯技艺'],
    ['耀州窑陶瓷烧制技艺','澄城尧头陶瓷烧制技艺'],
    ['平遥推光漆器髹饰技艺','清徐老陈醋酿制技艺','杏花村汾酒酿制技艺','阳城生铁冶铸技艺'],
    ['乌泥泾手工棉纺织技艺'],
    ['成都漆艺','德格印经院藏族雕版印刷技艺','泸州老窖酒酿制技艺','蜀锦织造技艺','自贡井盐深钻汲制技艺'],
    ['拉萨甲米水磨坊制作技艺','藏族邦典、卡垫织造技艺','藏族造纸技艺'],
    ['维吾尔族花毡、印花布织染技艺','维吾尔族模制法土陶烧制技艺','维吾尔族桑皮纸制作技艺'],
    ['阿昌族户撒刀锻制技艺','白族扎染技艺','傣族慢轮制陶技艺','傣族、纳西族手工造纸技艺'],
    ['湖笔制作技艺','龙泉宝剑锻制技艺','龙泉青瓷烧制技艺','绍兴黄酒酿制技艺','天台山干漆夹苎技艺','张小泉剪刀锻制技艺','竹纸制作技艺']
    ]

var url_list = [
    '选择Url',
    ['http://www.ihchina.cn/5/11041.html','http://www.ihchina.cn/5/11040.html','http://www.ihchina.cn/5/10969.html','http://www.ihchina.cn/5/11016.html','http://www.ihchina.cn/5/11006.html','http://www.ihchina.cn/5/11032.html'],
    ['http://www.ihchina.cn/5/11017.html','http://www.ihchina.cn/5/11010.html','http://www.ihchina.cn/5/11011.html','http://www.ihchina.cn/5/11044.html'],
    ['http://www.ihchina.cn/5/10978.html','http://www.ihchina.cn/5/11021.html','http://www.ihchina.cn/5/10995.html','http://www.ihchina.cn/5/11030.html','http://www.ihchina.cn/5/11022.html'],
    ['http://www.ihchina.cn/5/11009.html','http://www.ihchina.cn/5/11015.html'],
    ['http://www.ihchina.cn/5/11042.html','http://www.ihchina.cn/5/11056.html','http://www.ihchina.cn/5/10970.html'],
    ['http://www.ihchina.cn/5/10997.html','http://www.ihchina.cn/5/10987.html'],
    ['http://www.ihchina.cn/5/11024.html','http://www.ihchina.cn/5/10998.html','http://www.ihchina.cn/5/10992.html','http://www.ihchina.cn/5/11000.html','http://www.ihchina.cn/5/11034.html','http://www.ihchina.cn/5/11001.html'],
    ['http://www.ihchina.cn/5/10986.html','http://www.ihchina.cn/5/11051.html','http://www.ihchina.cn/5/10971.html'],
    ['http://www.ihchina.cn/5/10977.html'],
    ['http://www.ihchina.cn/5/11052.html'],
    ['http://www.ihchina.cn/5/10978.html','http://www.ihchina.cn/5/11021.html','http://www.ihchina.cn/5/10995.html'],
    ['http://www.ihchina.cn/5/11043.html','http://www.ihchina.cn/5/10996.html','http://www.ihchina.cn/5/10974.html','http://www.ihchina.cn/5/11033.html'],
    ['http://www.ihchina.cn/5/11045.html','http://www.ihchina.cn/5/11055.html','http://www.ihchina.cn/5/11046.html','http://www.ihchina.cn/5/11049.html','http://www.ihchina.cn/5/11003.html','http://www.ihchina.cn/5/10980.html','http://www.ihchina.cn/5/10991.html','http://www.ihchina.cn/5/11012.html','http://www.ihchina.cn/5/10981.html','http://www.ihchina.cn/5/10982.html','http://www.ihchina.cn/5/10999.html','http://www.ihchina.cn/5/10994.html','http://www.ihchina.cn/5/11019.html','http://www.ihchina.cn/5/10968.html','http://www.ihchina.cn/5/11029.html','http://www.ihchina.cn/5/11048.html'],
    ['http://www.ihchina.cn/5/11050.html','http://www.ihchina.cn/5/11013.html'],
    ['http://www.ihchina.cn/5/10989.html'],
    ['http://www.ihchina.cn/5/10975.html','http://www.ihchina.cn/5/10979.html'],
    ['http://www.ihchina.cn/5/11018.html','http://www.ihchina.cn/5/11028.html','http://www.ihchina.cn/5/11026.html','http://www.ihchina.cn/5/11002.html'],
    ['http://www.ihchina.cn/5/10984.html'],
    ['http://www.ihchina.cn/5/11023.html','http://www.ihchina.cn/5/11047.html','http://www.ihchina.cn/5/11025.html','http://www.ihchina.cn/5/10983.html','http://www.ihchina.cn/5/11031.html'],
    ['http://www.ihchina.cn/5/11014.html','http://www.ihchina.cn/5/10988.html','http://www.ihchina.cn/5/11036.html'],
    ['http://www.ihchina.cn/5/10990.html','http://www.ihchina.cn/5/10973.html','http://www.ihchina.cn/5/11037.html'],
    ['http://www.ihchina.cn/5/11008.html','http://www.ihchina.cn/5/10993.html','http://www.ihchina.cn/5/10972.html','http://www.ihchina.cn/5/11035.html'],
    ['http://www.ihchina.cn/5/11039.html','http://www.ihchina.cn/5/11004.html','http://www.ihchina.cn/5/10976.html','http://www.ihchina.cn/5/11027.html','http://www.ihchina.cn/5/11020.html','http://www.ihchina.cn/5/11005.html','http://www.ihchina.cn/5/11038.html']
]
