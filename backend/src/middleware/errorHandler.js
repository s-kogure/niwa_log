import { ErrorCodes } from '../errorCodes.js';

export function notFoundHandler(req, res, next) {
  const err = new Error(`Not Found: ${req.method} ${req.originalUrl}`);
  err.code = ErrorCodes.NOT_FOUND.code;
  err.status = ErrorCodes.NOT_FOUND.status;
  next(err);
}

export function errorHandler(err, req, res, next) {
  console.error(err);

  const status = err.status || ErrorCodes.INTERNAL_ERROR.status;
  const code = err.code || ErrorCodes.INTERNAL_ERROR.code;

  const body = {
    error: {
      code,
      message: err.message,
    },
  };

  if (err.details) {
    body.error.details = err.details;
  }

  if (process.env.NODE_ENV === 'development') {
    body.error.stack = err.stack;
  }

  res.status(status).json(body);
}