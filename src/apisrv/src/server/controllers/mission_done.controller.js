// resturant.controller.js
import mission_doneModule from '../modules/mission_done.module';

/*resturant  POST 新增 */
const mission_donePost = (req, res) => {
  // 取得新增參數
  const insertValues = req.body;
  mission_doneModule.createmission_done(insertValues).then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

/*  resturant GET 取得  */
const mission_doneGet = (req, res) => {
  missionModule.selectmission_done().then((result) => {
    res.send(result); // 成功回傳result結果
  }).catch((err) => { return res.send(err); }); // 失敗回傳錯誤訊息
};

export default {
    mission_donePost,
    mission_doneGet,
};
