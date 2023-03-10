/*
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░
░░░░░░░░░▀░░░░░█░░░░░░░▀░░░░░░░░
░░░░░░░░▀░▀░░░░█░░░░░█▀▀▀░░░░░░░
░░░░░░█░░░░░█░░█░░█░░█░░░░░░░░░░
░░░░░░▀▀▀▀▀▀▀░░▀▀▀▀▀▀▀▀▀▀░░░░░░░
░░░░░░░░░░░░░░░░░▀░▀░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
*/
#ifdef LLOC
#include "bits/gh.h"
#define debug(...) debug_out(#__VA_ARGS__, __VA_ARGS__)
#else
#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#define debug(...) 1
#endif
using namespace std;

typedef long long ll;
int tc;

void init()
{
}

#define MULTI
void solve()
{
}

int32_t main()
{
  ios_base::sync_with_stdio(0);
  cin.tie(0);
  int _t = 1;
#ifdef MULTI
    cin >> _t;
#endif
  init();
  for (tc = 1; tc <= _t; tc++)
    solve();

  return 0;
}
