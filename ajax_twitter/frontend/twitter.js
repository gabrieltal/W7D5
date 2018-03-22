const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");
$( () => {
  $("button.follow-toggle").each((index, button)  =>
    new FollowToggle(button)
  );

  $("nav.users-search").each((index, search) =>
    new UsersSearch(search)
  );
});
