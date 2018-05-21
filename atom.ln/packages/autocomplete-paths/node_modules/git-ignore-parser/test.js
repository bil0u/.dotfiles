'use strict';

const expect = require('chai').expect;
const parser = require('./lib/index.js');

describe('Parser', () => {

  it('should remove blank lines', () => {
    const src = 'foo\n\nbar';
    const expected = ['foo', 'bar'];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should remove comments', () => {
    const src = 'foo\n#A comment\nbar';
    const expected = ['foo', 'bar'];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should remove trailing spaces', () => {
    const src = 'foo  \nbar\nfoobar \nfoobarbar\\ ';
    const expected = ['foo', 'bar', 'foobar', 'foobarbar '];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should trim slashes', () => {
    const src = '/foo\nbar/\n/foo/bar/foobar/';
    const expected = ['foo', 'bar', 'foo/bar/foobar'];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should ignore duplicates', () => {
    const src = 'foo\nfoo';
    const expected = ['foo'];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should accept negative patterns', () => {
    const src = 'foo\n!bar\n\!foo!.bar';
    const expected = ['foo', '!bar', '!foo!.bar'];
    expect(parser(src)).to.deep.equal(expected);
  });

  it('should accept globs', () => {
    const src = '**/foo\nbar/**\n*.foobar\nfoo/**/*.bar';
    const expected = ['**/foo', 'bar/**', '*.foobar', 'foo/**/*.bar'];
    expect(parser(src)).to.deep.equal(expected);
  });

});
