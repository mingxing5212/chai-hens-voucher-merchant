<%--
  Created by IntelliJ IDEA.
  User: limingxing
  Date: 21/2/16
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/layouts/fragment/taglib.jsp"%>
<html>
<head>
  <title>代金券</title>
  <link href="${metronicPath}/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
  <link href="${metronicPath}/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="${metronicPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
  <link href="${metronicPath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="/">首页</a>
      <i class="fa fa-circle"></i>
    </li>
    <li>
      <span>卡券中心</span>
    </li>
  </ul>
  <div class="page-toolbar">
    <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
      <i class="icon-calendar"></i>&nbsp;
      <span class="thin uppercase hidden-xs">January 22, 2016 - February 20, 2016</span>&nbsp;
      <i class="fa fa-angle-down"></i>
    </div>
  </div>
</div>
<h3 class="page-title"> 代金券
  <small>可在购物中抵扣同样等值的现金使用.</small>
</h3>
<div class="note note-info">
  <p> 更多详细内容请点击
    <a href="ui_colors.html" target="_blank"> 代金券定义说明</a> 查看. </p>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet box red-sunglo">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-gift"></i>代金券 </div>
        <div class="tools">
          <a href="javascript:;" class="collapse" data-original-title="" title="收缩"> </a>
          <a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title="设置查询条件"> </a>
          <a href="javascript:;" class="reload" data-original-title="" title="刷新"> </a>
          <a href="" class="fullscreen" data-original-title="" title="全屏"> </a>
        </div>
      </div>
      <div class="portlet-body">
        <div class="table-toolbar">
          <div class="row">
            <div class="col-md-6">
              <div class="btn-group">
                <button id="btnCreateVoucher" class="btn sbold green" data-toggle="modal" href="#createVoucherModel"> 新增代金券
                  <i class="fa fa-plus"></i>
                </button>
              </div>
            </div>
            <div class="col-md-6">
              <div class="btn-group pull-right">
                <button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">工具
                  <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu pull-right">
                  <li>
                    <a href="javascript:;">
                      <i class="fa fa-print"></i> Print </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <i class="fa fa-file-pdf-o"></i> Save as PDF </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="dataTables_wrapper no-footer">
        <table class="table table-bordered table-striped table-condensed flip-content table-hover table-scrollable" id="promotions">
          <thead>
          <tr>
            <th>
              编号
            </th>
            <th>
              名称
            </th>
            <th>
              有效日期
            </th>
            <th>
              截至日期
            </th>
            <th>
              状态
            </th>
            <th>
              创建人
            </th>
            <th style="width: 240px;">
              操作
            </th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="voucher" items="${seed.result}">
            <tr voucherId="${voucher.id}">
              <td>${voucher.code}</td>
              <td>${voucher.name}</td>
              <td>${voucher.effectiveStartTime}</td>
              <td>${voucher.effectiveEndTime}</td>
              <td><mx:vstatus status="${voucher.status.code}"/></td>
              <td></td>
              <td><mx:vactions status="${voucher.status.code}"/></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <mx:pagination position="below"/>
      </div>
      </div>
    </div>
  </div>
</div>

<div id="createVoucherModel" class="modal fade" tabindex="-1" data-width="760">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">新增代金券</h4>
  </div>
  <div class="modal-body form">
    <form role="form">
      <div class="form-body">
        <div class="form-group">
          <label>名称</label>
          <input type="text" class="form-control" id="textVoucherName" placeholder="代金券名称">
        </div>
        <div class="form-group">
          <label>面值</label>
          <input type="text" class="form-control" id="textDenomination" placeholder="代金券面值(人民币)">
        </div>
        <div class="form-group">
          <label>发放总量</label>
          <input type="text" class="form-control" id="textAmount">
        </div>
        <div class="form-group">
          <label>生效时间</label>
          <input type="text" class="form-control" id="textVoucherFromTime" placeholder="代金券生效时间">
        </div>
        <div class="form-group">
          <label>过期时间</label>
          <input type="text" class="form-control" id="textVoucherToTime" placeholder="代金券过期时间">
        </div>
        <div class="form-group">
          <label>订单金额</label>
          <input type="text" class="form-control" id="textLimit" placeholder="满多少可以使用">
        </div>
      </div>
    </form>
  </div>
  <div class="modal-footer">
    <button type="button" data-dismiss="modal" class="btn btn-outline dark">取消</button>
    <button type="button" class="btn green" id="btnSave">保存</button>
  </div>
</div>
<script src="${metronicPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${metronicPath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${ctx}/resources/scripts/voucher/cash.js"></script>
</body>
</html>
