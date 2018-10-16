const [request, fs, util] = [require('request'), require('fs'), require('util')];

function run(page) {
  console.log(page);
  var options = {
    url: 'https://data-gkcx.eol.cn/soudaxue/queryschool.html?messtype=jsonp&callback=jQuery18306011522223216892_1529840560230&province&schooltype&page=' + page + '&size=50&keyWord1&schoolprop&schoolflag&schoolsort&schoolid&_=1529840560614',
    headers: {
      'Referer': 'https://gkcx.eol.cn//soudaxue/queryschool.html?messtype=jsonp&page=2',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36',
      'Host': 'data-gkcx.eol.cn',
      'DNT':"1",
      'Cookie': 'tool_ipuse=111.121.71.78; tool_ipprovince=52; tool_iparea=7',
      'Connection': 'Connection',
      'Accept-Language': 'zh-HK,zh-CN;q=0.9,zh-TW;q=0.8,zh;q=0.7,en-US;q=0.6,en;q=0.5',
      'Accept-Encoding': "gzip, deflate, br",
    },
    gzip: true
  };
  
  function callback(error, response, body) {
    if (!error && response.statusCode == 200) {
        body = body.split('jQuery18306011522223216892_1529840560230(')[1];
        body = body.substring(0, body.length - 2);
        const info = JSON.parse(body).school;
        info.forEach(element => {
            const {schoolname, province, f985, f211, membership, guanwang, ranking, shoufei, jianjie, schoolid} = element;
            fs.appendFileSync("data/line.sql", util.format("UPDATE `tqbk` SET `f985` = '%s', `f211` = '%s', `chafen` = '%s', `ranking` = '%s', `province` = '%s', `membership` = '%s', `guanwang` = '%s', `shoufei` = '%s', `jianjie` = '%s' WHERE `tqbk`.`school_name` = '%s';\n", f985, f211, "https://gkcx.eol.cn/schoolhtm/schoolTemple/school" + schoolid + '.htm', ranking, province, membership, guanwang, (shoufei.indexOf('\'') > 0 || shoufei.indexOf('"')) > 0 ? '未知' : shoufei,  (jianjie.indexOf('\'') > 0 || jianjie.indexOf('"')) > 0 ? '未知' : jianjie, schoolname), 'utf8');
        });
        if (page < 58) run(++page);
    } else {
        console.log('error');
        process.exit(1);
    }
  }
   
  request(options, callback);
}

run(1);