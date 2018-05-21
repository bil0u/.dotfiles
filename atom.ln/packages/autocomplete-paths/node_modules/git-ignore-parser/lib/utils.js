'use strict';

/**
 * NOTE: we don't remove trailing whitespaces if they are escaped with
 * backslash ("\ "), as specified in the Git documentation.
 */
function removeTrailingWhitespace(str) {
  if (!/\\\s+$/.test(str)) {
    // No escaped trailing whitespace, remove
    return str.replace(/\s+$/, '');
  } else {
    // Trailing whitespace detected, remove only the backslash
    return str.replace(/\\(\s+)$/, '$1');
  }
}

function trimSlashes(str) {
  let output = str;
  if (output.charAt(0) === '/') {
    output = output.substr(1);
  }
  if (output.charAt(output.length - 1) === '/') {
    output = output.substr(0, output.length - 1);
  }
  return output;
}

function isWhitespace(str) {
  return /^\s*$/.test(str);
}

function startsWithChar(str, char) {
  return new RegExp(`^${char}+.*$`).test(str);
}

module.exports = {
  trimSlashes: trimSlashes,
  removeTrailingWhitespace: removeTrailingWhitespace,
  isWhitespace: isWhitespace,
  startsWithChar: startsWithChar
};
