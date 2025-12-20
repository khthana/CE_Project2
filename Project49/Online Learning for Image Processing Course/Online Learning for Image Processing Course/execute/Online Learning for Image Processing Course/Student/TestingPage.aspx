<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestingPage.aspx.vb" Inherits="Student_TestingPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        วิชา
        <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
            SelectCommand="select sub_id, sub_name from subject where sub_id in (select sub_id 
                from result where reg_id = (SELECT reg_id FROM [register] 
                WHERE reg_year = (SELECT MAX(reg_year) FROM [register]) 
                and reg_term = (select max(reg_term) from register 
                where reg_year = (select max(reg_year) from register)) 
                and ([std_id] = @std_id))) order by sub_id">
            <SelectParameters>
                <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="gradeDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="select res_grade,reg_id from result where ([sub_id] = @sub_id) and reg_id = (
                            select reg_id from register where ([std_id] = @std_id) 
                            and reg_year = (select max(reg_year) from register) 
                            and reg_term = (select max(reg_term) from register 
                            where reg_year = (select max(reg_year) from register))
                            )">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
                <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gradeDTS">
            <Columns>
                <asp:BoundField DataField="res_grade" HeaderText="Grade" SortExpression="res_grade" />
                <asp:BoundField DataField="reg_id" HeaderText="reg_id" SortExpression="reg_id" Visible="False" />
            </Columns>
        </asp:GridView>
        การทดสอบประจำบทเรียน<br />
        <asp:SqlDataSource ID="moduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="SELECT [mod_id], [sub_id], [mod_number], [mod_wscore], [mod_datestart], [mod_dateend], [mod_time] 
                FROM [Module] WHERE ([sub_id] = @sub_id) and mod_year=(select max(cal_year) from learningcalendar)
                and mod_term=(select max(cal_term) from learningcalendar 
                where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [mod_number]">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="moduleGV" runat="server" AutoGenerateColumns="False" DataKeyNames="mod_id"
            DataSourceID="moduleDTS">
            <Columns>
                <asp:BoundField DataField="mod_id" HeaderText="mod_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="mod_id" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="mod_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&sub_id={1}&type=Module"
                    DataTextField="mod_number" HeaderText="การทดสอบครั้งที่" SortExpression="mod_number"
                    Target="_self" />
                <asp:BoundField DataField="mod_wscore" HeaderText="คะแนนเต็ม" SortExpression="mod_wscore" />
                <asp:BoundField DataField="mod_datestart" HeaderText="วันเริ่มต้นของการทดสอบ" SortExpression="mod_datestart" />
                <asp:BoundField DataField="mod_dateend" HeaderText="วันสุดท้ายของการทดสอบ" SortExpression="mod_dateend" />
                <asp:BoundField DataField="mod_time" HeaderText="เวลาที่ใช้ในการทดสอบ" SortExpression="mod_time" />
                <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="false" />
                <asp:BoundField DataField="mod_number" HeaderText="mod_number" SortExpression="mod_number"
                    Visible="False" />
            </Columns>
        </asp:GridView>
        การทดสอบเก็บคะแนน<br />
        <asp:SqlDataSource ID="assignmentDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="SELECT [ass_id], [sub_id], [ass_number], [ass_wscore], [ass_datestart], [ass_dateend], [ass_time] 
                FROM [Assignment] WHERE ([sub_id] = @sub_id) and ass_year=(select max(cal_year) from learningcalendar)
                and ass_term=(select max(cal_term) from learningcalendar 
                where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [ass_number]">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="assignmentGV" runat="server" DataSourceID="assignmentDTS" AutoGenerateColumns="False" DataKeyNames="ass_id">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ass_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&amp;sub_id={1}&amp;type=Assignment"
                    DataTextField="ass_number" HeaderText="การทดสอบครั้งที่" SortExpression="ass_number"
                    Target="_self" />
                <asp:BoundField DataField="ass_wscore" HeaderText="คะแนนเต็ม" SortExpression="ass_wscore" />
                <asp:BoundField DataField="ass_datestart" HeaderText="วันเริ่มต้นของการทดสอบ" SortExpression="ass_datestart" />
                <asp:BoundField DataField="ass_dateend" HeaderText="วันสุดท้ายของการทดสอบ" SortExpression="ass_dateend" />
                <asp:BoundField DataField="ass_time" HeaderText="เวลาที่ใช้ในการทดสอบ" SortExpression="ass_time" />
                <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="False" />
                <asp:BoundField DataField="ass_id" HeaderText="ass_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="ass_id" Visible="False" />
                <asp:BoundField DataField="ass_number" HeaderText="ass_number" SortExpression="ass_number"
                    Visible="False" />
            </Columns>
        </asp:GridView>
        การทดสอบปลายภาค<br />
        <asp:SqlDataSource ID="examDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="SELECT [exm_id], [sub_id], [exm_number], [exm_wscore], [exm_datestart], [exm_dateend], [exm_time] 
                FROM [Examination] WHERE ([sub_id] = @sub_id) and exm_year=(select max(cal_year) from learningcalendar)
                and exm_term=(select max(cal_term) from learningcalendar 
                where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [exm_number]">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="examGV" runat="server" AutoGenerateColumns="False" DataKeyNames="exm_id"
            DataSourceID="examDTS">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="exm_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&sub_id={1}&type=Examination"
                    DataTextField="exm_number" HeaderText="การทดสอบครั้งที่" SortExpression="exm_number"
                    Target="_self" />
                <asp:BoundField DataField="exm_wscore" HeaderText="คะแนนเต็ม" SortExpression="exm_wscore" />
                <asp:BoundField DataField="exm_datestart" HeaderText="วันเริ่มต้นของการทดสอบ" SortExpression="exm_datestart" />
                <asp:BoundField DataField="exm_dateend" HeaderText="วันสุดท้ายของการทดสอบ" SortExpression="exm_dateend" />
                <asp:BoundField DataField="exm_time" HeaderText="เวลาที่ใช้ในการทดสอบ" SortExpression="exm_time" />
                <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="false" />
                <asp:BoundField DataField="exm_id" HeaderText="exm_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="exm_id" Visible="False" />
                <asp:BoundField DataField="exm_number" HeaderText="exm_number" SortExpression="exm_number"
                    Visible="False" />
            </Columns>
        </asp:GridView>
        ผลคะแนนของการทดสอบประจำบทเรียน<br />
        <asp:SqlDataSource ID="resultmoduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="select s.scr_score,m.mod_number,m.mod_wscore from scoremodule s, module m 
                where s.mod_id=m.mod_id 
                and ([std_id] = @std_id) and s.mod_id in (select mod_id from module 
                where mod_year = (select max(cal_year) from learningcalendar) 
                and mod_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                and ([sub_id] = @sub_id))">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
                <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ResultModuleGV" runat="server" DataSourceID="resultmoduleDTS" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="mod_number" HeaderText="การทดสอบครั้งที่" SortExpression="mod_number" />
                <asp:BoundField DataField="mod_wscore" HeaderText="คะแนนเต็ม" SortExpression="mod_wscore" />
                <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
            </Columns>
        </asp:GridView>
        ผลคะแนนของการทดสอบเก็บคะแนน<br />
        <asp:SqlDataSource ID="resultassignmentDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="select s.scr_score,a.ass_number,a.ass_wscore from scoreassignment s, assignment a 
                where s.ass_id=a.ass_id 
                and ([std_id] = @std_id) and s.ass_id in (select ass_id from assignment 
                where ass_year = (select max(cal_year) from learningcalendar) 
                and ass_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                and ([sub_id] = @sub_id))">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
                <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ResultAssignmentGV" runat="server" DataSourceID="resultassignmentDTS" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ass_number" HeaderText="การทดสอบครั้งที่" SortExpression="ass_number" />
                <asp:BoundField DataField="ass_wscore" HeaderText="คะแนนเต็ม" SortExpression="ass_wscore" />
                <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
            </Columns>
        </asp:GridView>
        ผลคะแนนของการทดสอบปลายภาค<br />
        <asp:SqlDataSource ID="resultexaminationDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
            SelectCommand="select s.scr_score,e.exm_number,e.exm_wscore from scoreexamination s, examination e 
                where s.exm_id=e.exm_id 
                and ([std_id] = @std_id) and s.exm_id in (select exm_id from examination 
                where exm_year = (select max(cal_year) from learningcalendar) 
                and exm_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                and ([sub_id] = @sub_id))">
            <SelectParameters>
                <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                    Type="Int64" />
                <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ResultExaminationGV" runat="server" DataSourceID="resultexaminationDTS" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="exm_number" HeaderText="การทดสอบครั้งที่" SortExpression="exm_number" />
                <asp:BoundField DataField="exm_wscore" HeaderText="คะแนนเต็ม" SortExpression="exm_wscore" />
                <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
