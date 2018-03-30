export const signup = (userForm) => (
  $.ajax({
    url: '/api/users',
    method: 'POST',
    data: {
      user: userForm
    }
  })
);

export const login = (userForm) => (
  $.ajax({
    url: 'api/session',
    method: 'POST',
    data: {
      user: userForm
    }
  })
);

export const logout = () => (
  $.ajax({
    url: 'api/session',
    method: 'DELETE'
  })
);
