'use strict';

const utils = require('./utils');

module.exports = function parser(input) {
  let output = [];

  // Create an array of entries from raw input
  const entries = input.split(/\n/);

  entries.forEach(entry => {
    let cleanEntry;

    if (!(utils.isWhitespace(entry) || utils.startsWithChar(entry, '#'))) {
      cleanEntry = utils.removeTrailingWhitespace(entry);
      cleanEntry = utils.trimSlashes(cleanEntry);
      if (!output.includes(cleanEntry)) {
        output.push(cleanEntry);
      }
    }
  });

  return output;
}
