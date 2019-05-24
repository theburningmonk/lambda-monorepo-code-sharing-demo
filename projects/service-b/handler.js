const { parse } = require('../../libraries/library-a/index')
const { stringify } = require('../../libraries/library-b/index')

module.exports.hello = async (event) => {
  const json = stringify(event)
  const clone = parse(json)

  return {
    statusCode: 200,
    body: JSON.stringify({
      input: clone,
    }, null, 2),
  };
};