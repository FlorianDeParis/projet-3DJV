<?php
/*
  Template Name: Ajouter un événement
 */

/**
 * Main template file
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WordPress
 * @subpackage 3DJV
 * @since 3DJV
 */

get_header();

include_once dirname(__FILE__).'/../../plugins/spider-event-calendar/calendar_functions.php';

function testField ($field, $errors, $message) {
    if (empty($field)) {
        $errors[] = $message;
    }
    
    return $errors;
}

if (isset($_POST['save_event'])) {
    $errors = [];
    
    $errors = testField($_POST['title'], $errors, "Veuillez définir le titre");
    $errors = testField($_POST['category'], $errors, "Veuillez définir la catégorie");
    $errors = testField($_POST['date'], $errors, "Veuillez définir la date");
    
    if (count($errors) <= 0) {
        apply_spider_event($_POST['category'], -1);
    }
}


?>

		<div id="container">
			<div id="content" role="main" style="background-color: white;">
                            <?php
                                if (count($errors) > 0) {
                            ?>
                                <ul class="errors">
                                    <?php
                                        foreach ($errors as $error) {
                                    ?>
                                        <li><?php echo $error; ?></li><br>
                                    <?php
                                        }
                                    ?>
                                </ul>
                            <?php
                                }
                            ?>
                            <form action="#" method="post" id="adminForm" name="adminForm">
                                <table width="95%">
                                  <tbody><tr>
                                    <td style="width:45%">
                                      <div style="width:95%">
                                        <fieldset class="adminform">
                                          <legend>Détails de l'événement</legend>
                                          <table class="admintable">
                                            <tbody><tr>
                                              <td class="key"><label for="title">Titre: </label></td>
                                              <td><input type="text" id="title" name="title" size="41"></td>
                                            </tr>

                                                            <tr>
                                              <td class="key"><label for="category">Selectionner la catégorie: </label></td>
                                              <td>
                                                                            <select id="category" name="category" style="width:240px">
                                                                                    <option value="0">--Select Category--</option>
                                                                                                <option value="1">Evênement  1</option>
                                                                                    </select>
                                                              </td>
                                            </tr>
                                            <tr>
                                              <td class="key"><label for="date">Date: </label></td>
                                              <td>
                                                <input style="width:90px" class="inputbox" type="text" name="date" id="date" size="10" maxlength="10" value="">
                                                <input type="reset" class="wd_button" value="..." onclick="return showCalendar('date','%Y-%m-%d');" style="width: 31px;">
                                              </td>
                                            </tr>
                                            <tr>
                                              <td class="key"><label for="selhour_from">Heure: </label></td>
                                                                <td>
                                                <input type="text" id="selhour_from" name="selhour_from" size="1" style="text-align:right" onkeypress="return checkhour('selhour_from',event)" value="" title="from" onblur="add_0('selhour_from')"> <b>:</b>
                                                <input type="text" id="selminute_from" name="selminute_from" size="1" style="text-align:right" onkeypress="return checkminute('selminute_from',event)" value="" title="from" onblur="add_0('selminute_from')">
                                                <span style="font-size:12px">&nbsp;-&nbsp;</span>
                                                <input type="text" id="selhour_to" name="selhour_to" size="1" style="text-align:right" onkeypress="return checkhour('selhour_to',event)" value="" title="to" onblur="add_0('selhour_to')"> <b>:</b>
                                                <input type="text" id="selminute_to" name="selminute_to" size="1" style="text-align:right" onkeypress="return checkminute('selminute_to',event)" value="" title="to" onblur="add_0('selminute_to')">
                                              </td>
                                                              </tr>
                                            <tr>
                                              <td class="key"><label for="poststuff">Note: </label></td>
                                              <td>
                                                <?php wp_editor( "", "3djv_editor_id", $settings = array() ); ?>
                                              </td>
                                            </tr>
                                          </tbody></table>
                                        </fieldset>
                                      </div>
                                    </td>
                                    <td style="padding-left:25px; vertical-align:top !important; width:45%">
                                      <div style="width:100%">
                                        <fieldset class="adminform" style="margin-left: -25px;"><legend>Repeat Event</legend>
                                          <table>
                                            <tbody><tr>
                                              <td valign="top">
                                                                    <input type="radio" id="no_repeat_type" value="no_repeat" name="repeat_method" checked="checked" onchange="change_type('no_repeat')">
                                                                    <label for="no_repeat_type">Don't repeat this event</label>
                                                <br>
                                                <input type="radio" id="daily_type" value="daily" name="repeat_method" onchange="change_type('daily');">
                                                                    <label for="daily_type">Repeat daily</label>
                                                                    <br>
                                                <input type="radio" id="weekly_type" value="weekly" name="repeat_method" onchange="change_type('weekly');">
                                                                    <label for="weekly_type">Repeat weekly</label>
                                                                    <br>
                                                <input type="radio" id="monthly_type" value="monthly" name="repeat_method" onchange="change_type('monthly');">
                                                                    <label for="monthly_type">Repeat monthly</label>
                                                                    <br>
                                                <input type="radio" id="yearly_type" value="yearly" name="repeat_method" onchange="change_type('yearly');">
                                                                    <label for="yearly_type">Repeat yearly</label>
                                                                    <br>
                                              </td>
                                              <td style="padding-left:10px" valign="top">
                                                <div id="daily" style="display:none">Repeat every
                                                  <input type="text" id="repeat_input" size="5" name="repeat" onclick="return input_repeat()" onkeypress="return checknumber(repeat_input)" value="1">
                                                  <label id="repeat"></label>
                                                  <label id="year_month" style="display:none;">
                                                    <select name="year_month" id="year_month" class="inputbox">
                                                      <option value="1" selected="selected">Janvier</option>
                                                      <option value="2">Février</option>
                                                      <option value="3">Mars</option>
                                                      <option value="4">Avril</option>
                                                      <option value="5">Mai</option>
                                                      <option value="6">Juin</option>
                                                      <option value="7">Juillet</option>
                                                      <option value="8">Août</option>
                                                      <option value="9">Septembre</option>
                                                      <option value="10">Octobre</option>
                                                      <option value="11">Novembre</option>
                                                      <option value="12">Décembre</option>
                                                    </select>
                                                  </label>
                                                </div>
                                                <br>
                                                <input type="hidden" id="daily1">
                                                <input type="hidden" id="weekly1">
                                                <input type="hidden" id="monthly1">
                                                <input type="hidden" id="yearly1">
                                                <div class="key" id="weekly" style="display:none">
                                                  <input type="checkbox" value="Mon" id="week_1" onchange="week_value()">Mon
                                                  <input type="checkbox" value="Tue" id="week_2" onchange="week_value()">Tue
                                                  <input type="checkbox" value="Wed" id="week_3" onchange="week_value()">Wed
                                                  <input type="checkbox" value="Thu" id="week_4" onchange="week_value()">Thu
                                                  <input type="checkbox" value="Fri" id="week_5" onchange="week_value()">Fri
                                                  <input type="checkbox" value="Sat" id="week_6" onchange="week_value()">Sat
                                                  <input type="checkbox" value="Sun" id="week_7" onchange="week_value()">Sun
                                                  <input type="hidden" name="week" id="week">
                                                </div>
                                                <br>
                                                <div class="key" id="monthly" style="display:none">
                                                  <input type="radio" id="radio1" onchange="radio_month()" name="month_type" value="1" checked="checked">le:  
                                                  <input type="text" onkeypress="return checknumber(month)" name="month" size="3" id="month"><br>
                                                  <input type="radio" id="radio2" onchange="radio_month()" name="month_type" value="2">le: 
                                                  <select name="monthly_list" id="monthly_list" class="inputbox" disabled="">
                                                    <option value="1">Premier</option>
                                                    <option value="8">Deuxième</option>
                                                    <option value="15">Troisième</option>
                                                    <option value="22">Quatrième</option>
                                                    <option value="last">Dernier</option>
                                                  </select>
                                                  <select name="month_week" id="month_week" class="inputbox" disabled="">
                                                    <option value="Mon">Lundi</option>
                                                    <option value="Tue">Mardi</option>
                                                    <option value="Wed">Mercredi</option>
                                                    <option value="Thu">Jeudi</option>
                                                    <option value="Fri">Vendredi</option>
                                                    <option value="Sat">Samedi</option>
                                                    <option value="Sun">Dimanche</option>
                                                  </select>
                                                </div>
                                                <br>
                                                <script>
                                                  window.onload = radio_month();
                                                </script>
                                              </td>
                                            </tr>
                                            <tr id="repeat_until" style="display:none">
                                              <td>Repeat until: </td>
                                              <td>
                                                <input style="width:90px" class="inputbox" type="text" name="date_end" id="date_end" size="10" maxlength="10" value="">
                                                <input type="reset" class="wd_button" value="..." onclick="return showCalendar('date_end','%Y-%m-%d');">
                                              </td>
                                            </tr>
                                          </tbody></table>
                                        </fieldset>
                                      </div>
                                    </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <input type="hidden" name="save_event">
                                          <input type="submit" value="Save" class="button-secondary action">
                                      </td>
                                  </tr>
                                </tbody></table>
                                    <input type="hidden" id="nonce_sp_cal" name="nonce_sp_cal" value="4978dd5fd7"><input type="hidden" name="_wp_http_referer" value="/projet-3DJV/wp-admin/admin.php?page=SpiderCalendar&amp;task=add_event&amp;calendar_id=2">    <input type="hidden" name="option" value="com_spidercalendar">
                                <input type="hidden" name="task" value="">
                                <input type="hidden" name="calendar" value="">
                                <input type="hidden" name="published" value="0">
                            </form>
			</div><!-- #content -->
		</div><!-- #container -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
