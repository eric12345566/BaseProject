// resturant.controller.js
import couponModule from '../modules/coupon.module';

/*resturant  POST 新增 */
const couponPost = (req, res) => {
  // 取得新增參數
  const insertValues = req.body;
  couponModule.createcoupon(insertValues).then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

/*  resturant GET 取得  */
const couponGet = (req, res) => {
    couponModule.selectcoupon().then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

export default {
    couponPost,
    couponGet,
};
