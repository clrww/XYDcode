
function CardKindUtil() {
}
CardKindUtil.prototype = {
    0: "汽车信用卡" ,
    1: "航空信用卡",
    getType:function(key){
        //alert(key);
        //alert(this[key]);
        return this[key];
    }
}
