// resturant.controller.js
import resturantModule from '../modules/resturant.module';

/*resturant  POST 新增 */
const resturantPost = (req, res) => {
  // 取得新增參數
  const insertValues = req.body;
  resturantModule.createresturant(insertValues).then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

/*  resturant GET 取得  */
const resturantGet = (req, res) => {
  resturantModule.selectresturant().then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};


/*  resturant GET 取得  */
const res_idGet = (req, res) => {
  const restId = req.params.id;

  resturantModule.selectres_id(restId).then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

const search_idGet = (req, res) => {
  const searchid = req.params.num;

  resturantModule.selectsearch_id(searchid).then((result) => {
   res.send(result); // 成功回傳result結果
 }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

const idnameGet = (req, res) => {
  resturantModule.selectidname().then((result) => {
   res.send(result); // 成功回傳result結果
 }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

export default {
  resturantPost,
  resturantGet,
  res_idGet,
  search_idGet,
  idnameGet
};