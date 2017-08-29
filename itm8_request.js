// Utils
var closedClause = function(date) {
  return {
    "$or": [
      { // doc.activationStart <= date <= doc.activationEnd
        "activationStart": { "$lte": date },
        "activationEnd": { "$gte": date }
      },
      { // doc.activationStart <= date if doc.activationEnd.isEmpty
        "activationEnd": { "$exists": false },
        "activationStart": { "$lte": date }
      }
    ]
  }
};

var openedClause = function(date) {
  return {
    "$or": [
      { // doc.activationStart <= date <= doc.activationEnd
        "activationStart": { "$lte": date },
        "activationEnd": { "$gte": date }
      },
      { // (doc.activationStart <= date || doc.activationStart >= date)
        // if doc.activationEnd.isEmpty
        "activationEnd": { "$exists": false }
      }
    ]
  }
};

var dateSelector = function(parent) {
  if (parent.activationEnd/* Some */) {
    return {
      "$or": [ // either doc#period contains activationStart ...
        closedClause(parent.activationStart),
        closedClause(parent.activationEnd) // or it contains activationEnd
      ]
    };
  } else { // doc#period must contain activationStart
    return openedClause(parent.activationStart)
  }
}

function floatApproxToNum(num) {
  if (num.floatApprox != undefined) {return num.floatApprox} else {return num}
}

function perItm8(period) {
  return function(parent) {
    var selector = {
      commit_id: parent.commit_id,
      country: parent.country,
      article: floatApproxToNum(parent.article),
    };

    // Use period from closure rather itm8 one
    var query = Object.assign(selector, dateSelector(period)); // merge
    print("itm8: " + JSON.stringify(query));

    return db.article.find(query)
  };
}

// 2nd scan (reverse order for JS def): itm8_base
var perItm8Base = function(parent) {
  var selector = {
    commit_id: parent.commit_id,
    country: parent.country,
    itm8: floatApproxToNum(parent.itm8),
    article: floatApproxToNum(parent.article),
    operation: parent.operation
  };

  var query = Object.assign(selector, dateSelector(parent)); // merge
  print("itm8_base: " + JSON.stringify(query));

  return db.itm8.find(query).map(perItm8({ // Rather itm8_base_ens top period
    activationStart: parent.activationStart,
    activationEnd: parent.activationEnd
  }));
};

// Root scan: itm8_base_ens
var perItm8BaseEns = function(parent) {
  var selector = {
    commit_id: parent.commit_id,
    country: parent.country,
    itm8: parent.itm8,
    article: parent.article,
    operation: parent.operation
  };

  print("itm8_base_ens: " + JSON.stringify(selector));

  // ITM8xxx join
  var query1 = Object.assign(selector, { base: parent.base }, dateSelector(parent));

  return db.itm8_base.find(query1).map(perItm8Base);
};

function arrLength(v) { return v.length}

db.itm8_base_ens.find({}).map(perItm8BaseEns).map(function(arr) { return arr.map(arrLength)});
