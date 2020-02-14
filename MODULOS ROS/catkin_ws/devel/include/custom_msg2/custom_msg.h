// Generated by gencpp from file custom_msg2/custom_msg.msg
// DO NOT EDIT!


#ifndef CUSTOM_MSG2_MESSAGE_CUSTOM_MSG_H
#define CUSTOM_MSG2_MESSAGE_CUSTOM_MSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <custom_msg2/KeyPoint.h>

namespace custom_msg2
{
template <class ContainerAllocator>
struct custom_msg_
{
  typedef custom_msg_<ContainerAllocator> Type;

  custom_msg_()
    : points()  {
    }
  custom_msg_(const ContainerAllocator& _alloc)
    : points(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::custom_msg2::KeyPoint_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::custom_msg2::KeyPoint_<ContainerAllocator> >::other >  _points_type;
  _points_type points;





  typedef boost::shared_ptr< ::custom_msg2::custom_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::custom_msg2::custom_msg_<ContainerAllocator> const> ConstPtr;

}; // struct custom_msg_

typedef ::custom_msg2::custom_msg_<std::allocator<void> > custom_msg;

typedef boost::shared_ptr< ::custom_msg2::custom_msg > custom_msgPtr;
typedef boost::shared_ptr< ::custom_msg2::custom_msg const> custom_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::custom_msg2::custom_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::custom_msg2::custom_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace custom_msg2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'custom_msg2': ['/home/robotica/catkin_ws/src/custom_msg2/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::custom_msg2::custom_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::custom_msg2::custom_msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::custom_msg2::custom_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::custom_msg2::custom_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::custom_msg2::custom_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::custom_msg2::custom_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::custom_msg2::custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "02f30d3dee59acda5881ac1e535c914c";
  }

  static const char* value(const ::custom_msg2::custom_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x02f30d3dee59acdaULL;
  static const uint64_t static_value2 = 0x5881ac1e535c914cULL;
};

template<class ContainerAllocator>
struct DataType< ::custom_msg2::custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "custom_msg2/custom_msg";
  }

  static const char* value(const ::custom_msg2::custom_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::custom_msg2::custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "custom_msg2/KeyPoint[] points\n\
\n\
================================================================================\n\
MSG: custom_msg2/KeyPoint\n\
custom_msg2/Point2f pt\n\
float32 size\n\
float32 angle\n\
float32 response\n\
int32 octave\n\
int32 class_id\n\
int32 idKeypoint\n\
\n\
\n\
================================================================================\n\
MSG: custom_msg2/Point2f\n\
float32 x\n\
float32 y\n\
\n\
";
  }

  static const char* value(const ::custom_msg2::custom_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::custom_msg2::custom_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.points);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct custom_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::custom_msg2::custom_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::custom_msg2::custom_msg_<ContainerAllocator>& v)
  {
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::custom_msg2::KeyPoint_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CUSTOM_MSG2_MESSAGE_CUSTOM_MSG_H