const mysqlConnect = {
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '',
  database: 'proqure_site',
}

exports.mysqlConnect = mysqlConnect;

const isTest = true;
exports.uploadUrl = isTest ? "E:\\e-commerce\\Proqure_Site\\server\\public\\upload" : "/home/ec2-user/proqure/server/public/upload";
exports.API_KEY = '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';
exports.privateKey = 'OPAYPRV16965158649910.3265507653748203';
exports.publickey = 'OPAYPUB16965158649910.6194431221300881';
exports.MerchantId = '281823100568339';
