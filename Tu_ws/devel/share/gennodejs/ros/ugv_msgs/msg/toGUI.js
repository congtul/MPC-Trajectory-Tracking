// Auto-generated. Do not edit!

// (in-package ugv_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class toGUI {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lat_postion = null;
      this.lng_postion = null;
      this.x = null;
      this.y = null;
      this.set_speed = null;
      this.speed_left = null;
      this.speed_right = null;
      this.yaw = null;
      this.set_steering = null;
      this.steering = null;
      this.num_mpc_refpath = null;
      this.x_mpc_repath = null;
      this.y_mpc_repath = null;
      this.yaw_mpc_repath = null;
    }
    else {
      if (initObj.hasOwnProperty('lat_postion')) {
        this.lat_postion = initObj.lat_postion
      }
      else {
        this.lat_postion = 0.0;
      }
      if (initObj.hasOwnProperty('lng_postion')) {
        this.lng_postion = initObj.lng_postion
      }
      else {
        this.lng_postion = 0.0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('set_speed')) {
        this.set_speed = initObj.set_speed
      }
      else {
        this.set_speed = 0.0;
      }
      if (initObj.hasOwnProperty('speed_left')) {
        this.speed_left = initObj.speed_left
      }
      else {
        this.speed_left = 0.0;
      }
      if (initObj.hasOwnProperty('speed_right')) {
        this.speed_right = initObj.speed_right
      }
      else {
        this.speed_right = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('set_steering')) {
        this.set_steering = initObj.set_steering
      }
      else {
        this.set_steering = 0.0;
      }
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0.0;
      }
      if (initObj.hasOwnProperty('num_mpc_refpath')) {
        this.num_mpc_refpath = initObj.num_mpc_refpath
      }
      else {
        this.num_mpc_refpath = 0;
      }
      if (initObj.hasOwnProperty('x_mpc_repath')) {
        this.x_mpc_repath = initObj.x_mpc_repath
      }
      else {
        this.x_mpc_repath = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('y_mpc_repath')) {
        this.y_mpc_repath = initObj.y_mpc_repath
      }
      else {
        this.y_mpc_repath = new Array(20).fill(0);
      }
      if (initObj.hasOwnProperty('yaw_mpc_repath')) {
        this.yaw_mpc_repath = initObj.yaw_mpc_repath
      }
      else {
        this.yaw_mpc_repath = new Array(20).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type toGUI
    // Serialize message field [lat_postion]
    bufferOffset = _serializer.float64(obj.lat_postion, buffer, bufferOffset);
    // Serialize message field [lng_postion]
    bufferOffset = _serializer.float64(obj.lng_postion, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [set_speed]
    bufferOffset = _serializer.float32(obj.set_speed, buffer, bufferOffset);
    // Serialize message field [speed_left]
    bufferOffset = _serializer.float32(obj.speed_left, buffer, bufferOffset);
    // Serialize message field [speed_right]
    bufferOffset = _serializer.float32(obj.speed_right, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [set_steering]
    bufferOffset = _serializer.float32(obj.set_steering, buffer, bufferOffset);
    // Serialize message field [steering]
    bufferOffset = _serializer.float32(obj.steering, buffer, bufferOffset);
    // Serialize message field [num_mpc_refpath]
    bufferOffset = _serializer.int8(obj.num_mpc_refpath, buffer, bufferOffset);
    // Check that the constant length array field [x_mpc_repath] has the right length
    if (obj.x_mpc_repath.length !== 20) {
      throw new Error('Unable to serialize array field x_mpc_repath - length must be 20')
    }
    // Serialize message field [x_mpc_repath]
    bufferOffset = _arraySerializer.float32(obj.x_mpc_repath, buffer, bufferOffset, 20);
    // Check that the constant length array field [y_mpc_repath] has the right length
    if (obj.y_mpc_repath.length !== 20) {
      throw new Error('Unable to serialize array field y_mpc_repath - length must be 20')
    }
    // Serialize message field [y_mpc_repath]
    bufferOffset = _arraySerializer.float32(obj.y_mpc_repath, buffer, bufferOffset, 20);
    // Check that the constant length array field [yaw_mpc_repath] has the right length
    if (obj.yaw_mpc_repath.length !== 20) {
      throw new Error('Unable to serialize array field yaw_mpc_repath - length must be 20')
    }
    // Serialize message field [yaw_mpc_repath]
    bufferOffset = _arraySerializer.float32(obj.yaw_mpc_repath, buffer, bufferOffset, 20);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type toGUI
    let len;
    let data = new toGUI(null);
    // Deserialize message field [lat_postion]
    data.lat_postion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lng_postion]
    data.lng_postion = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_speed]
    data.set_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_left]
    data.speed_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_right]
    data.speed_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_steering]
    data.set_steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering]
    data.steering = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [num_mpc_refpath]
    data.num_mpc_refpath = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [x_mpc_repath]
    data.x_mpc_repath = _arrayDeserializer.float32(buffer, bufferOffset, 20)
    // Deserialize message field [y_mpc_repath]
    data.y_mpc_repath = _arrayDeserializer.float32(buffer, bufferOffset, 20)
    // Deserialize message field [yaw_mpc_repath]
    data.yaw_mpc_repath = _arrayDeserializer.float32(buffer, bufferOffset, 20)
    return data;
  }

  static getMessageSize(object) {
    return 289;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ugv_msgs/toGUI';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a28929b5edb2cd02f7ac9cd5152eccc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #GPS Data 
    float64 lat_postion
    float64 lng_postion
    float32 x
    float32 y
    float32 set_speed
    float32 speed_left
    float32 speed_right
    
    #IMU Data 
    #float32 roll
    #float32 pitch
    float32 yaw
    
    #Controll Data
    float32 set_steering
    float32 steering
    int8 num_mpc_refpath
    float32[20] x_mpc_repath
    float32[20] y_mpc_repath
    float32[20] yaw_mpc_repath
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new toGUI(null);
    if (msg.lat_postion !== undefined) {
      resolved.lat_postion = msg.lat_postion;
    }
    else {
      resolved.lat_postion = 0.0
    }

    if (msg.lng_postion !== undefined) {
      resolved.lng_postion = msg.lng_postion;
    }
    else {
      resolved.lng_postion = 0.0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.set_speed !== undefined) {
      resolved.set_speed = msg.set_speed;
    }
    else {
      resolved.set_speed = 0.0
    }

    if (msg.speed_left !== undefined) {
      resolved.speed_left = msg.speed_left;
    }
    else {
      resolved.speed_left = 0.0
    }

    if (msg.speed_right !== undefined) {
      resolved.speed_right = msg.speed_right;
    }
    else {
      resolved.speed_right = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.set_steering !== undefined) {
      resolved.set_steering = msg.set_steering;
    }
    else {
      resolved.set_steering = 0.0
    }

    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0.0
    }

    if (msg.num_mpc_refpath !== undefined) {
      resolved.num_mpc_refpath = msg.num_mpc_refpath;
    }
    else {
      resolved.num_mpc_refpath = 0
    }

    if (msg.x_mpc_repath !== undefined) {
      resolved.x_mpc_repath = msg.x_mpc_repath;
    }
    else {
      resolved.x_mpc_repath = new Array(20).fill(0)
    }

    if (msg.y_mpc_repath !== undefined) {
      resolved.y_mpc_repath = msg.y_mpc_repath;
    }
    else {
      resolved.y_mpc_repath = new Array(20).fill(0)
    }

    if (msg.yaw_mpc_repath !== undefined) {
      resolved.yaw_mpc_repath = msg.yaw_mpc_repath;
    }
    else {
      resolved.yaw_mpc_repath = new Array(20).fill(0)
    }

    return resolved;
    }
};

module.exports = toGUI;
