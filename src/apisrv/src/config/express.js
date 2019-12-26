import express from 'express';
import bodyParser from 'body-parser';
import morgan from 'morgan';
import cors from 'cors';
import config from './config';
import index from '../server/routes/index.route';

const app = express();

// parse body params and attache them to req.body
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// enable CORS - Cross Origin Resource Sharing
app.use(cors());

// HTTP request logger middleware for node.js
app.use(morgan('dev'));

/* GET home page. */
app.get('/', (req, res) => {
  res.send(`server started on  port http://127.0.0.1:${config.port} (${config.env})`);
});

// api service
app.use('/api', index);

// images service
app.use('/imgs', express.static(`${process.cwd()}/public/img`));
// onsole.log(`${process.cwd()}/public/img`);
export default app;
