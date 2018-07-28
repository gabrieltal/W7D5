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
