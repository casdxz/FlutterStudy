import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/sample/demo_page.dart';
import 'package:flutter_demo/sample/plant_shop.dart';
import 'package:flutter_demo/sample/timeline_page.dart';
import 'package:flutter_demo/widget/single/align_padding_widget.dart';
import 'package:flutter_demo/widget/single/box_widget.dart';
import 'package:flutter_demo/widget/single/clip_widget.dart';
import 'package:flutter_demo/widget/stateful/animatedbuilder_widget.dart';
import 'package:flutter_demo/widget/stateful/animatedcontainer_widget.dart';
import 'package:flutter_demo/widget/stateful/animatedeffect_widget.dart';
import 'package:flutter_demo/widget/stateful/animatedlist_widget.dart';
import 'package:flutter_demo/widget/stateful/animatedswitcher_widget.dart';
import 'package:flutter_demo/widget/stateful/bottomsheet_widget.dart';
import 'package:flutter_demo/widget/stateful/checkboxradio_widget.dart';
import 'package:flutter_demo/widget/stateful/draggable_widget.dart';
import 'package:flutter_demo/widget/stateful/expansion_widget.dart';
import 'package:flutter_demo/widget/stateful/form_widget.dart';
import 'package:flutter_demo/widget/stateful/futurebuild_widget.dart';
import 'package:flutter_demo/widget/stateful/hero_widget.dart';
import 'package:flutter_demo/widget/stateful/image_widget.dart';
import 'package:flutter_demo/widget/stateful/ink_widget.dart';
import 'package:flutter_demo/widget/stateful/listwheelscrollview_widget.dart';
import 'package:flutter_demo/widget/stateful/material_widget.dart';
import 'package:flutter_demo/widget/stateful/materialapp_widget.dart';
import 'package:flutter_demo/widget/stateful/overlay_widget.dart';
import 'package:flutter_demo/widget/stateful/pageviewcontrol.dart';
import 'package:flutter_demo/widget/stateful/progressindicator_widget.dart';
import 'package:flutter_demo/widget/stateful/rangeslider_widget.dart';
import 'package:flutter_demo/widget/stateful/refreshindicator_widget.dart';
import 'package:flutter_demo/widget/stateful/reorderablelistview_widget.dart';
import 'package:flutter_demo/widget/stateful/scaffold_widget.dart';
import 'package:flutter_demo/widget/stateful/selectabletext_widget.dart';
import 'package:flutter_demo/widget/stateful/slider_widget.dart';
import 'package:flutter_demo/widget/stateful/sliverappbar_widget.dart';
import 'package:flutter_demo/widget/stateful/snackbar_widget.dart';
import 'package:flutter_demo/widget/stateful/stepper_widget.dart';
import 'package:flutter_demo/widget/stateful/textfield_widget.dart';
import 'package:flutter_demo/widget/stateful/transitioneffect_widget.dart';
import 'package:flutter_demo/widget/stateful/valuelistenablebuilder_widget.dart';
import 'package:flutter_demo/widget/stateful/willpopscope_widget.dart';
import 'package:flutter_demo/widget/stateless/CheckboxListTile.dart';
import 'package:flutter_demo/widget/stateless/aboutdialog.dart';
import 'package:flutter_demo/widget/stateless/cupertion.dart';
import 'package:flutter_demo/widget/stateless/daypicker.dart';
import 'package:flutter_demo/widget/stateless/dialog.dart';
import 'package:flutter_demo/widget/stateless/aboutlisttile.dart';
import 'package:flutter_demo/widget/stateless/actionchip_widget.dart';
import 'package:flutter_demo/widget/stateless/alertDialog.dart';
import 'package:flutter_demo/widget/stateless/button_widget.dart';
import 'package:flutter_demo/widget/stateless/card_widget.dart';
import 'package:flutter_demo/widget/stateless/chip_widget.dart';
import 'package:flutter_demo/widget/stateless/choicechip_widget.dart';
import 'package:flutter_demo/widget/stateless/circleavatar_widget.dart';
import 'package:flutter_demo/widget/stateless/container_widget.dart';
import 'package:flutter_demo/widget/stateless/divider.dart';
import 'package:flutter_demo/widget/stateless/filterchip.dart';
import 'package:flutter_demo/widget/stateless/gesturedetector_widget.dart';
import 'package:flutter_demo/widget/stateless/gridtile.dart';
import 'package:flutter_demo/widget/stateless/gridview_widget.dart';
import 'package:flutter_demo/widget/stateless/icon.dart';
import 'package:flutter_demo/widget/stateless/inputchip_widget.dart';
import 'package:flutter_demo/widget/stateless/listtile_widget.dart';
import 'package:flutter_demo/widget/stateless/listview_widget.dart';
import 'package:flutter_demo/widget/stateless/materialbanner.dart';
import 'package:flutter_demo/widget/stateless/mypreferredsize.dart';
import 'package:flutter_demo/widget/stateless/navigationtoolbar.dart';
import 'package:flutter_demo/widget/stateless/pageview_widget.dart';
import 'package:flutter_demo/widget/stateless/placeholder.dart';
import 'package:flutter_demo/widget/stateless/radiolisttile.dart';
import 'package:flutter_demo/widget/stateless/safearea.dart';
import 'package:flutter_demo/widget/stateless/simpledialog.dart';
import 'package:flutter_demo/widget/stateless/singlechildscrollview_widget.dart';
import 'package:flutter_demo/widget/stateless/space.dart';
import 'package:flutter_demo/widget/stateless/switchlisttile.dart';
import 'package:flutter_demo/widget/stateless/text_widget.dart';
import 'package:flutter_demo/widget/stateless/theme_widget.dart';
import 'package:flutter_demo/widget/stateless/useraccountdrawerheader_widget.dart';
import 'package:flutter_demo/widget/stateless/visiblity_widget.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/index': (context) => const Index(),
  // 无状态组件导航
  '/container': (context) => const ContainerWidget(),
  '/text': (context) => const TextWidget(),
  '/listview': (context) => const ListViewWidget(),
  '/gridview': (context) => const GridViewWidget(),
  '/singlechildscrollview': (context) => const SingleChildScrollViewWidget(),
  '/pageview': (context) => const PageViewWidget(),
  '/pageviewcontrol': (context) => const PageViewControl(),
  '/circleavatar': (context) => const CircleAvatarWidget(),
  '/chip': (context) => const ChipWidget(),
  '/inputchip': (context) => const InputChipWidget(),
  '/filterchip': (context) => const FilterChipWidget(),
  '/choicechip': (context) => const ChoiceChipWidget(),
  '/actionchip': (context) => const ActionChipWidget(),
  '/theme': (context) => const ThemeWidget(),
  '/gesturedetector': (context) => const GestureDetectorWidget(),
  '/useraccountdrawerheader': (context) => const UserAccountDrawerHeaderWidget(),
  '/button': (context) => const ButtonWidget(),
  '/card': (context) => const CardWidget(),
  '/visiblity': (context) => const VisiblityWidget(),
  '/listtile': (context) => const ListTileWidget(),
  '/checkboxlisttile': (context) => const CheckboxListTileWidget(),
  '/switchlisttile': (context) => const SwitchListTileWidget(),
  '/radiolisttile': (context) => const RadioListTileWidget(),
  '/gridtile': (context) => const GridTileWidget(),
  '/aboutlisttile': (context) => const AboutListTileWidget(),
  '/spacer': (context) => const SpacerWidget(),
  '/alertdialog': (context) => const AlertDialogWidget(),
  '/dialog': (context) => const DialogWidget(),
  '/aboutdialog': (context) => const AboutDialogWidget(),
  '/simpledialog': (context) => const SimpleDialogWidget(),
  '/daypicker': (context) => const DayPickerWidget(),
  '/safearea': (context) => const SafeAreaWidget(),
  '/materialbanner': (context) => const MaterialBannerWidget(),
  '/navigationtoolbar': (context) => const NavigationToolbarWidget(),
  '/placeholder': (context) => const PlaceholderWidget(),
  '/icon': (context) => const IconWidget(),
  '/divider': (context) => const DividerWidget(),
  '/cupertion': (context) => const CupertionWidget(),
  '/mypreferredsize': (context) => const MyPreferredSizeWidget(),

  // 有状态组件导航
  '/image': (context) => const ImageWidget(),
  '/sliverappbar': (context) => const SliverAppBarWidget(),
  '/animatedcontainer': (context) => const AnimatedContainerWidget(),
  '/animatedbuilder': (context) => const AnimatedBuilderWidget(),
  '/animatedlist': (context) => const AnimatedListWidget(),
  '/animatedswitcher': (context) => const AnimatedSwitcherWidget(),
  '/animatedeffect': (context) => const AnimatedEffectWidget(),
  '/transitioneffect': (context) => const TransitionEffectWidget(),
  '/material': (context) => const MaterialWidget(),
  '/materialapp': (context) => const MaterialAppWidget(),
  '/willpopscope': (context) => const WillPopScopeWidget(),
  '/hero': (context) => const HeroWidget(),
  '/futurebuild': (context) => const FutureBuilderWidget(),
  '/overlay': (context) => const OverlayWidget(),
  '/stepper': (context) => const StepperWidget(),
  '/checkboxradio': (context) => const CheckBoxRadioWidget(),
  '/slider': (context) => const SliderWidget(),
  '/rangeslider': (context) => const RangeSliderWidget(),
  '/snackbar': (context) => const SnackBarWidget(),
  '/refreshindicator': (context) => const RefreshIndicatorWidget(),
  '/draggable': (context) => const DraggableWidget(),
  '/bottomsheet': (context) => const BottomSheetWidget(),
  '/reorderablelistview': (context) => const ReorderableListViewWidget(),
  '/listwheelscrollview': (context) => const ListWheelScrollViewWidget(),
  '/form': (context) => const FormWidget(),
  '/textfield': (context) => const TextFieldWidget(),
  '/expansion': (context) => const ExpansionWidget(),
  '/valuelistenablebuilder': (context) => const ValueListenableBuilderWidget(),
  '/scaffold': (context) => const ScaffoldWidget(),
  '/ink': (context) => const InkWidget(),
  '/progressindicator': (context) => const ProgressIndicatorWidget(),
  '/selectabletext': (context) => const SelectableTextWidget(),

  //组件导航
  '/clip': (context) => const ClipWidget(),
  '/box': (context) => const BoxWidget(),
  '/alignpadding': (context) => const AlignPaddingWidget(),

  // 示例导航
  '/demo-page': (context) => const DemoPae(),
  '/plant-shop': (context) => const PlantShop(),
  '/timeline': (context) => const TimelinePage(),
};