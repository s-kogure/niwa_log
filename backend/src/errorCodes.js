export const ErrorCodes = {
  VALIDATION_ERROR: { code: 'VALIDATION_ERROR', status: 400 },
  NOT_FOUND: { code: 'NOT_FOUND', status: 404 },
  UNAUTHORIZED: { code: 'UNAUTHORIZED', status: 401 },
  FORBIDDEN: { code: 'FORBIDDEN', status: 403 },
  INTERNAL_ERROR: { code: 'INTERNAL_ERROR', status: 500 },
};

// ErrorCodesの定義とメッセージからエラーオブジェクトを組み立てて返す
// throwするかnext()へ渡すかは呼び出し側が決める
export const createError = (errorCode, message) => {
  const err = new Error(message);

  err.code = errorCode.code;
  err.status = errorCode.status;

  return err;
};
