// resturant.controller.js
import missionModule from '../modules/mission.module';

/*resturant  POST 新增 */
const missionPost = (req, res) => {
  // 取得新增參數
  const insertValues = req.body;
  missionModule.createmission(insertValues).then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

/*  resturant GET 取得  */
const missionGet = (req, res) => {
  missionModule.selectmission().then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

export default {
    missionPost,
    missionGet,
};
