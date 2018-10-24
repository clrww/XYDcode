
function CardTransation(){

}
CardTransation.prototype={
    0:"快捷支付",
    1:"POS支付",
    getType:function(key){
        return this[key];
    }
}