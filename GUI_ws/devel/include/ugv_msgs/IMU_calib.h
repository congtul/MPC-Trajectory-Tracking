// Generated by gencpp from file ugv_msgs/IMU_calib.msg
// DO NOT EDIT!


#ifndef UGV_MSGS_MESSAGE_IMU_CALIB_H
#define UGV_MSGS_MESSAGE_IMU_CALIB_H


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
struct IMU_calib_
{
  typedef IMU_calib_<ContainerAllocator> Type;

  IMU_calib_()
    : parameters(0.0)
    , mode(0)  {
    }
  IMU_calib_(const ContainerAllocator& _alloc)
    : parameters(0.0)
    , mode(0)  {
  (void)_alloc;
    }



   typedef double _parameters_type;
  _parameters_type parameters;

   typedef int8_t _mode_type;
  _mode_type mode;





  typedef boost::shared_ptr< ::ugv_msgs::IMU_calib_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ugv_msgs::IMU_calib_<ContainerAllocator> const> ConstPtr;

}; // struct IMU_calib_

typedef ::ugv_msgs::IMU_calib_<std::allocator<void> > IMU_calib;

typedef boost::shared_ptr< ::ugv_msgs::IMU_calib > IMU_calibPtr;
typedef boost::shared_ptr< ::ugv_msgs::IMU_calib const> IMU_calibConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ugv_msgs::IMU_calib_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ugv_msgs::IMU_calib_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ugv_msgs::IMU_calib_<ContainerAllocator1> & lhs, const ::ugv_msgs::IMU_calib_<ContainerAllocator2> & rhs)
{
  return lhs.parameters == rhs.parameters &&
    lhs.mode == rhs.mode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ugv_msgs::IMU_calib_<ContainerAllocator1> & lhs, const ::ugv_msgs::IMU_calib_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ugv_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ugv_msgs::IMU_calib_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ugv_msgs::IMU_calib_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ugv_msgs::IMU_calib_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8a20590408efba6d64d7d538c77eb428";
  }

  static const char* value(const ::ugv_msgs::IMU_calib_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8a20590408efba6dULL;
  static const uint64_t static_value2 = 0x64d7d538c77eb428ULL;
};

template<class ContainerAllocator>
struct DataType< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ugv_msgs/IMU_calib";
  }

  static const char* value(const ::ugv_msgs::IMU_calib_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 parameters\n"
"int8 mode\n"
;
  }

  static const char* value(const ::ugv_msgs::IMU_calib_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.parameters);
      stream.next(m.mode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct IMU_calib_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ugv_msgs::IMU_calib_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ugv_msgs::IMU_calib_<ContainerAllocator>& v)
  {
    s << indent << "parameters: ";
    Printer<double>::stream(s, indent + "  ", v.parameters);
    s << indent << "mode: ";
    Printer<int8_t>::stream(s, indent + "  ", v.mode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UGV_MSGS_MESSAGE_IMU_CALIB_H