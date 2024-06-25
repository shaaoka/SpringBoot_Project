 function ul(empPermissions, deptno) {
          let ul = $('#sidebarnav');
          let li = `  <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">後台功能列表</span>
            </li>`;
          if (empPermissions == 1 || empPermissions == 2) {
            li += ` <li class="sidebar-item">
          <a class="sidebar-link" href="" aria-expanded="false" onclick="empChangeHref()" id="Member">
            <span>
              <i class="ti ti-user-plus"></i>
            </span>
            <span class="hide-menu">會員管理功能</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="" aria-expanded="false" id="product">
            <span>
              <i class="ti ti-article"></i>
            </span>
            <span class="hide-menu">產品管理功能</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="#" aria-expanded="false" id="order">
            <span>
              <i class="ti ti-alert-circle"></i>
            </span>
            <span class="hide-menu">訂單管理功能</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="./ui-card.html" aria-expanded="false" id="reservation">
            <span>
              <i class="ti ti-cards"></i>
            </span>
            <span class="hide-menu">訂位管理功能</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false" id="delivery">
            <span>
              <i class="ti ti-file-description"></i>
            </span>
            <span class="hide-menu">外送管理功能</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false" id="promotions">
            <span>
              <i class="ti ti-typography"></i>
            </span>
            <span class="hide-menu">活動管理功能</span>
          </a>
        </li>`;
            ul.append(li);
            $('#Member').attr('href', 'Member.SelectAll/1');
            $('#product').attr('href', '/product/Product_Test_Main');
            $('#order').attr('href', '/order/order.action');
            $('#reservation').attr('href', '/reservation/reservemain.controller');
            $('#delivery').attr('href', '/delivery/home');
            $('#promotions').attr('href', '/promotions/promotionsMain');
          } if (empPermissions == 3) {
            switch (deptno) {
              case '601': {
                li += `<li class="sidebar-item">
              <a class="sidebar-link" href="" aria-expanded="false" onclick="empChangeHref()" id="Member">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                <span class="hide-menu">會員管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#Member').attr('href', 'Member.SelectAllByNotHidden/1');
                break;
              }
              case '602': {
                li += ` <li class="sidebar-item">
              <a class="sidebar-link" href="" aria-expanded="false" id="product">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                <span class="hide-menu">產品管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#product').attr('href', '/product/Product_Test_Main');
                break;
              }
              case '603': {
                li += `<li class="sidebar-item">
              <a class="sidebar-link" href="#" aria-expanded="false" id="order">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
                <span class="hide-menu">訂單管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#order').attr('href', '/order/order.action');
                break;
              }
              case '604': {
                li += `<li class="sidebar-item">
              <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false" id="promotions">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
                <span class="hide-menu">活動管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#promotions').attr('href', '/promotions/promotionsMain');
                break;
              }
              case '605': {
                li += `<li class="sidebar-item">
              <a class="sidebar-link" href="./ui-card.html" aria-expanded="false" id="reservation">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                <span class="hide-menu">訂位管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#reservation').attr('href', '/reservation/reservemain.controller');
                break;
              }
              case '606': {
                li += ` <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false" id="delivery">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                <span class="hide-menu">外送管理功能</span>
              </a>
            </li>`;
                ul.append(li);
                $('#delivery').attr('href', '/delivery/home');
                break;
              }
            }
          }
        };

