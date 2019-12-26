/** Slot Controller */
import slotModules from '../modules/slot.module';

const slotGet = (req, res) => {
  slotModules.slotUser().then((result) => {
    res.send(result);
  }).catch((err) => { return res.send(err); });
};

export default {
  slotGet
};
