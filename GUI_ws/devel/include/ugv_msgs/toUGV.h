// Generated by gencpp from file ugv_msgs/toUGV.msg
// DO NOT EDIT!


#ifndef UGV_MSGS_MESSAGE_TOUGV_H
#define UGV_MSGS_MESSAGE_TOUGV_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ugv_msgs
{
template <class ContainerAllocator>
struct toUGV_
{
  typedef toUGV_<ContainerAllocator> Type;

  toUGV_()
    : mode(0)
    , start_mode(0)
    , send_parameters(0)
    , Kp_steering(0.0)
    , Ki_steering(0.0)
    , Kd_steering(0.0)
    , Kp_speed(0.0)
    , Ki_speed(0.0)
    , Kd_speed(0.0)
    , set_speed(0.0)
    , set_angle(0.0)
    , mpc_L_wheel(0.0)
    , mpc_Np(0)
    , mpc_Nc(0)
    , mpc_Q()
    , mpc_Qp()
    , mpc_R(0.0)
    , mpc_umax(0.0)
    , mpc_umin(0.0)
    , refpoint_offset(0)
    , lqr_L_wheel(0.0)
    , lqr_Np(0)
    , lqr_Q()
    , lqr_K()
    , lqr_R(0.0)
    , lqr_umax(0.0)
    , lqr_umin(0.0)
    , TrajectoryType(0)
    , numWaypoint(0)
    , lat_base(0.0)
    , lng_base(0.0)
    , X_point()
    , Y_point()  {
      mpc_Q.assign(0.0);

      mpc_Qp.assign(0.0);

      lqr_Q.assign(0.0);

      lqr_K.assign(0.0);

      X_point.assign(0.0);

      Y_point.assign(0.0);
  }
  toUGV_(const ContainerAllocator& _alloc)
    : mode(0)
    , start_mode(0)
    , send_parameters(0)
    , Kp_steering(0.0)
    , Ki_steering(0.0)
    , Kd_steering(0.0)
    , Kp_speed(0.0)
    , Ki_speed(0.0)
    , Kd_speed(0.0)
    , set_speed(0.0)
    , set_angle(0.0)
    , mpc_L_wheel(0.0)
    , mpc_Np(0)
    , mpc_Nc(0)
    , mpc_Q()
    , mpc_Qp()
    , mpc_R(0.0)
    , mpc_umax(0.0)
    , mpc_umin(0.0)
    , refpoint_offset(0)
    , lqr_L_wheel(0.0)
    , lqr_Np(0)
    , lqr_Q()
    , lqr_K()
    , lqr_R(0.0)
    , lqr_umax(0.0)
    , lqr_umin(0.0)
    , TrajectoryType(0)
    , numWaypoint(0)
    , lat_base(0.0)
    , lng_base(0.0)
    , X_point()
    , Y_point()  {
  (void)_alloc;
      mpc_Q.assign(0.0);

      mpc_Qp.assign(0.0);

      lqr_Q.assign(0.0);

      lqr_K.assign(0.0);

      X_point.assign(0.0);

      Y_point.assign(0.0);
  }



   typedef uint8_t _mode_type;
  _mode_type mode;

   typedef uint8_t _start_mode_type;
  _start_mode_type start_mode;

   typedef uint8_t _send_parameters_type;
  _send_parameters_type send_parameters;

   typedef double _Kp_steering_type;
  _Kp_steering_type Kp_steering;

   typedef double _Ki_steering_type;
  _Ki_steering_type Ki_steering;

   typedef double _Kd_steering_type;
  _Kd_steering_type Kd_steering;

   typedef double _Kp_speed_type;
  _Kp_speed_type Kp_speed;

   typedef double _Ki_speed_type;
  _Ki_speed_type Ki_speed;

   typedef double _Kd_speed_type;
  _Kd_speed_type Kd_speed;

   typedef double _set_speed_type;
  _set_speed_type set_speed;

   typedef double _set_angle_type;
  _set_angle_type set_angle;

   typedef double _mpc_L_wheel_type;
  _mpc_L_wheel_type mpc_L_wheel;

   typedef int8_t _mpc_Np_type;
  _mpc_Np_type mpc_Np;

   typedef int8_t _mpc_Nc_type;
  _mpc_Nc_type mpc_Nc;

   typedef boost::array<double, 3>  _mpc_Q_type;
  _mpc_Q_type mpc_Q;

   typedef boost::array<double, 3>  _mpc_Qp_type;
  _mpc_Qp_type mpc_Qp;

   typedef double _mpc_R_type;
  _mpc_R_type mpc_R;

   typedef double _mpc_umax_type;
  _mpc_umax_type mpc_umax;

   typedef double _mpc_umin_type;
  _mpc_umin_type mpc_umin;

   typedef int8_t _refpoint_offset_type;
  _refpoint_offset_type refpoint_offset;

   typedef double _lqr_L_wheel_type;
  _lqr_L_wheel_type lqr_L_wheel;

   typedef int8_t _lqr_Np_type;
  _lqr_Np_type lqr_Np;

   typedef boost::array<double, 3>  _lqr_Q_type;
  _lqr_Q_type lqr_Q;

   typedef boost::array<double, 3>  _lqr_K_type;
  _lqr_K_type lqr_K;

   typedef double _lqr_R_type;
  _lqr_R_type lqr_R;

   typedef double _lqr_umax_type;
  _lqr_umax_type lqr_umax;

   typedef double _lqr_umin_type;
  _lqr_umin_type lqr_umin;

   typedef int8_t _TrajectoryType_type;
  _TrajectoryType_type TrajectoryType;

   typedef int8_t _numWaypoint_type;
  _numWaypoint_type numWaypoint;

   typedef double _lat_base_type;
  _lat_base_type lat_base;

   typedef double _lng_base_type;
  _lng_base_type lng_base;

   typedef boost::array<double, 40>  _X_point_type;
  _X_point_type X_point;

   typedef boost::array<double, 40>  _Y_point_type;
  _Y_point_type Y_point;





  typedef boost::shared_ptr< ::ugv_msgs::toUGV_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ugv_msgs::toUGV_<ContainerAllocator> const> ConstPtr;

}; // struct toUGV_

typedef ::ugv_msgs::toUGV_<std::allocator<void> > toUGV;

typedef boost::shared_ptr< ::ugv_msgs::toUGV > toUGVPtr;
typedef boost::shared_ptr< ::ugv_msgs::toUGV const> toUGVConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ugv_msgs::toUGV_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ugv_msgs::toUGV_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ugv_msgs::toUGV_<ContainerAllocator1> & lhs, const ::ugv_msgs::toUGV_<ContainerAllocator2> & rhs)
{
  return lhs.mode == rhs.mode &&
    lhs.start_mode == rhs.start_mode &&
    lhs.send_parameters == rhs.send_parameters &&
    lhs.Kp_steering == rhs.Kp_steering &&
    lhs.Ki_steering == rhs.Ki_steering &&
    lhs.Kd_steering == rhs.Kd_steering &&
    lhs.Kp_speed == rhs.Kp_speed &&
    lhs.Ki_speed == rhs.Ki_speed &&
    lhs.Kd_speed == rhs.Kd_speed &&
    lhs.set_speed == rhs.set_speed &&
    lhs.set_angle == rhs.set_angle &&
    lhs.mpc_L_wheel == rhs.mpc_L_wheel &&
    lhs.mpc_Np == rhs.mpc_Np &&
    lhs.mpc_Nc == rhs.mpc_Nc &&
    lhs.mpc_Q == rhs.mpc_Q &&
    lhs.mpc_Qp == rhs.mpc_Qp &&
    lhs.mpc_R == rhs.mpc_R &&
    lhs.mpc_umax == rhs.mpc_umax &&
    lhs.mpc_umin == rhs.mpc_umin &&
    lhs.refpoint_offset == rhs.refpoint_offset &&
    lhs.lqr_L_wheel == rhs.lqr_L_wheel &&
    lhs.lqr_Np == rhs.lqr_Np &&
    lhs.lqr_Q == rhs.lqr_Q &&
    lhs.lqr_K == rhs.lqr_K &&
    lhs.lqr_R == rhs.lqr_R &&
    lhs.lqr_umax == rhs.lqr_umax &&
    lhs.lqr_umin == rhs.lqr_umin &&
    lhs.TrajectoryType == rhs.TrajectoryType &&
    lhs.numWaypoint == rhs.numWaypoint &&
    lhs.lat_base == rhs.lat_base &&
    lhs.lng_base == rhs.lng_base &&
    lhs.X_point == rhs.X_point &&
    lhs.Y_point == rhs.Y_point;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ugv_msgs::toUGV_<ContainerAllocator1> & lhs, const ::ugv_msgs::toUGV_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ugv_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ugv_msgs::toUGV_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ugv_msgs::toUGV_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ugv_msgs::toUGV_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ugv_msgs::toUGV_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ugv_msgs::toUGV_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ugv_msgs::toUGV_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ugv_msgs::toUGV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1efb4b5a89c87d8d3553438208941e46";
  }

  static const char* value(const ::ugv_msgs::toUGV_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1efb4b5a89c87d8dULL;
  static const uint64_t static_value2 = 0x3553438208941e46ULL;
};

template<class ContainerAllocator>
struct DataType< ::ugv_msgs::toUGV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ugv_msgs/toUGV";
  }

  static const char* value(const ::ugv_msgs::toUGV_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ugv_msgs::toUGV_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#0: update PID, 1: manual, 2: MPC, 3: LQR\n"
"uint8 mode\n"
"uint8 start_mode\n"
"uint8 send_parameters\n"
"\n"
"#Parameters for PID\n"
"float64 Kp_steering\n"
"float64 Ki_steering \n"
"float64 Kd_steering\n"
"float64 Kp_speed\n"
"float64 Ki_speed \n"
"float64 Kd_speed\n"
"\n"
"# Parameters for manual\n"
"float64 set_speed\n"
"float64 set_angle\n"
"\n"
"# Parameters for MPC\n"
"float64 mpc_L_wheel\n"
"int8 mpc_Np\n"
"int8 mpc_Nc\n"
"float64[3] mpc_Q\n"
"float64[3] mpc_Qp\n"
"float64 mpc_R\n"
"float64 mpc_umax\n"
"float64 mpc_umin\n"
"int8 refpoint_offset\n"
"\n"
"#Parameters for LQR\n"
"float64 lqr_L_wheel\n"
"int8 lqr_Np\n"
"float64[3] lqr_Q\n"
"float64[3] lqr_K\n"
"float64 lqr_R\n"
"float64 lqr_umax\n"
"float64 lqr_umin\n"
"\n"
"int8 TrajectoryType #Line = 0\n"
"\n"
"int8 numWaypoint   # number of waypoint except for base waypoint\n"
"float64 lat_base\n"
"float64 lng_base\n"
"float64[40] X_point\n"
"float64[40] Y_point\n"
;
  }

  static const char* value(const ::ugv_msgs::toUGV_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ugv_msgs::toUGV_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mode);
      stream.next(m.start_mode);
      stream.next(m.send_parameters);
      stream.next(m.Kp_steering);
      stream.next(m.Ki_steering);
      stream.next(m.Kd_steering);
      stream.next(m.Kp_speed);
      stream.next(m.Ki_speed);
      stream.next(m.Kd_speed);
      stream.next(m.set_speed);
      stream.next(m.set_angle);
      stream.next(m.mpc_L_wheel);
      stream.next(m.mpc_Np);
      stream.next(m.mpc_Nc);
      stream.next(m.mpc_Q);
      stream.next(m.mpc_Qp);
      stream.next(m.mpc_R);
      stream.next(m.mpc_umax);
      stream.next(m.mpc_umin);
      stream.next(m.refpoint_offset);
      stream.next(m.lqr_L_wheel);
      stream.next(m.lqr_Np);
      stream.next(m.lqr_Q);
      stream.next(m.lqr_K);
      stream.next(m.lqr_R);
      stream.next(m.lqr_umax);
      stream.next(m.lqr_umin);
      stream.next(m.TrajectoryType);
      stream.next(m.numWaypoint);
      stream.next(m.lat_base);
      stream.next(m.lng_base);
      stream.next(m.X_point);
      stream.next(m.Y_point);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct toUGV_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ugv_msgs::toUGV_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ugv_msgs::toUGV_<ContainerAllocator>& v)
  {
    s << indent << "mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.mode);
    s << indent << "start_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.start_mode);
    s << indent << "send_parameters: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.send_parameters);
    s << indent << "Kp_steering: ";
    Printer<double>::stream(s, indent + "  ", v.Kp_steering);
    s << indent << "Ki_steering: ";
    Printer<double>::stream(s, indent + "  ", v.Ki_steering);
    s << indent << "Kd_steering: ";
    Printer<double>::stream(s, indent + "  ", v.Kd_steering);
    s << indent << "Kp_speed: ";
    Printer<double>::stream(s, indent + "  ", v.Kp_speed);
    s << indent << "Ki_speed: ";
    Printer<double>::stream(s, indent + "  ", v.Ki_speed);
    s << indent << "Kd_speed: ";
    Printer<double>::stream(s, indent + "  ", v.Kd_speed);
    s << indent << "set_speed: ";
    Printer<double>::stream(s, indent + "  ", v.set_speed);
    s << indent << "set_angle: ";
    Printer<double>::stream(s, indent + "  ", v.set_angle);
    s << indent << "mpc_L_wheel: ";
    Printer<double>::stream(s, indent + "  ", v.mpc_L_wheel);
    s << indent << "mpc_Np: ";
    Printer<int8_t>::stream(s, indent + "  ", v.mpc_Np);
    s << indent << "mpc_Nc: ";
    Printer<int8_t>::stream(s, indent + "  ", v.mpc_Nc);
    s << indent << "mpc_Q[]" << std::endl;
    for (size_t i = 0; i < v.mpc_Q.size(); ++i)
    {
      s << indent << "  mpc_Q[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.mpc_Q[i]);
    }
    s << indent << "mpc_Qp[]" << std::endl;
    for (size_t i = 0; i < v.mpc_Qp.size(); ++i)
    {
      s << indent << "  mpc_Qp[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.mpc_Qp[i]);
    }
    s << indent << "mpc_R: ";
    Printer<double>::stream(s, indent + "  ", v.mpc_R);
    s << indent << "mpc_umax: ";
    Printer<double>::stream(s, indent + "  ", v.mpc_umax);
    s << indent << "mpc_umin: ";
    Printer<double>::stream(s, indent + "  ", v.mpc_umin);
    s << indent << "refpoint_offset: ";
    Printer<int8_t>::stream(s, indent + "  ", v.refpoint_offset);
    s << indent << "lqr_L_wheel: ";
    Printer<double>::stream(s, indent + "  ", v.lqr_L_wheel);
    s << indent << "lqr_Np: ";
    Printer<int8_t>::stream(s, indent + "  ", v.lqr_Np);
    s << indent << "lqr_Q[]" << std::endl;
    for (size_t i = 0; i < v.lqr_Q.size(); ++i)
    {
      s << indent << "  lqr_Q[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.lqr_Q[i]);
    }
    s << indent << "lqr_K[]" << std::endl;
    for (size_t i = 0; i < v.lqr_K.size(); ++i)
    {
      s << indent << "  lqr_K[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.lqr_K[i]);
    }
    s << indent << "lqr_R: ";
    Printer<double>::stream(s, indent + "  ", v.lqr_R);
    s << indent << "lqr_umax: ";
    Printer<double>::stream(s, indent + "  ", v.lqr_umax);
    s << indent << "lqr_umin: ";
    Printer<double>::stream(s, indent + "  ", v.lqr_umin);
    s << indent << "TrajectoryType: ";
    Printer<int8_t>::stream(s, indent + "  ", v.TrajectoryType);
    s << indent << "numWaypoint: ";
    Printer<int8_t>::stream(s, indent + "  ", v.numWaypoint);
    s << indent << "lat_base: ";
    Printer<double>::stream(s, indent + "  ", v.lat_base);
    s << indent << "lng_base: ";
    Printer<double>::stream(s, indent + "  ", v.lng_base);
    s << indent << "X_point[]" << std::endl;
    for (size_t i = 0; i < v.X_point.size(); ++i)
    {
      s << indent << "  X_point[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.X_point[i]);
    }
    s << indent << "Y_point[]" << std::endl;
    for (size_t i = 0; i < v.Y_point.size(); ++i)
    {
      s << indent << "  Y_point[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.Y_point[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // UGV_MSGS_MESSAGE_TOUGV_H
