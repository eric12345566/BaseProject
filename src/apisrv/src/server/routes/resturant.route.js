import express from 'express';
import resturantCtrl from '../controllers/resturant.controller';
import paramValidation from '../../config/param-validation';
import validate from  '../../config/param-validation';

const router = express.Router();

router.route('/')
  .get(resturantCtrl.resturantGet) /** 取得 User 所有值組 */
  .post(resturantCtrl.resturantPost); /** 新增 User 值組 */


router.route('/search').get(resturantCtrl.idnameGet);

// 根據rest_id找餐廳詳細資料
router.route('/:id').get(resturantCtrl.res_idGet);

router.route('/list/:num').get(resturantCtrl.search_idGet);

export default router;