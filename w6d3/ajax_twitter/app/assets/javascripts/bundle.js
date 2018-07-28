/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);
$( () => {
  $("button.follow-toggle").each((index, button)  =>
    new FollowToggle(button)
  );

  $("nav.users-search").each((index, search) =>
    new UsersSearch(search)
  );
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {


const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor (el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();

    this.$el.on('click', this.handleClick.bind(this));
  }

  render () {
    if (this.followState === "followed") {
      this.$el.html("unfollow");
    } else {

      this.$el.html("follow");
    }
  }

  handleClick(event) {
    // const follotToggle = this;
    event.preventDefault();
    if (this.followState === "followed") {
      APIUtil.unfollowUser(this.userId);
      this.followState = "unfollowed";
    } else {
      APIUtil.followUser(this.userId);
      this.followState = "followed";
    }

    this.render();
  }
}
module.exports = FollowToggle;


// let lola = {
//   name: "Lola",
//   sayHi: function () {
//     console.log("hi");
//   }
// };
//
// lola.sayHi();
//
// let unboundSayHi = lola.sayHi;
// unboundSayHi();
//
//
// function ajax(opts) {
//   // do the ajax ApplicationController
//   let success = opts.success;
//   success();
//
//   opts.succees();
// }


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => APIUtil.toggleFollow(id, "POST"),

  unfollowUser: id => APIUtil.toggleFollow(id, "DELETE"),


 toggleFollow: (User, requestType) => {
    $.ajax({
      url: `/users/${User}/follow`,
      method: requestType,
      dataType: "json"
    });
  },

  searchUsers: (queryVal, success) => {
    $.ajax({
      url: `/users/search`,
      data: queryVal,
      dataType: "json",
      success: success
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const APIUtil = __webpack_require__(2);
class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input[name=username]');
    this.$ul = this.$el.find('.users');
    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(event) {

    if(this.$input.val() === '') {
      this.renderResults([]);
      return;
    }
    APIUtil.searchUsers(this.$input.val())
    .then(users => this.renderResults(users));
  }

  renderResults(users) {

    this.$ul.empty();

    for (let i = 0; i < users.length; i++) {
      const user = users[i];

      let $a = $('<a></a>');
      $a.text(`@${user.username}`);
      $a.attr('href', `/users/${user.id}`);

      const $followToggle = $('<button></button>');
      new FollowToggle($followToggle, {
        userId: user.id,
        followState: user.followed ? 'followed' : 'unfollowed'
      });

      const $li = $('<li></li>');
      $li.append($a);
      $li.append($followToggle);

      this.$ul.append($li);


    }



  }
}


 module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map